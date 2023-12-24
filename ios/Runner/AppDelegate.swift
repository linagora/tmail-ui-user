import UIKit
import Flutter
import flutter_downloader
import receive_sharing_intent
import flutter_local_notifications

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {

    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
        
        if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().delegate = self as UNUserNotificationCenterDelegate
        }
        
        FlutterLocalNotificationsPlugin.setPluginRegistrantCallback { registry in
            GeneratedPluginRegistrant.register(with: registry)
        }
        
        FlutterDownloaderPlugin.setPluginRegistrantCallback { registry in
            if (!registry.hasPlugin("FlutterDownloaderPlugin")) {
                FlutterDownloaderPlugin.register(with: registry.registrar(forPlugin: "FlutterDownloaderPlugin")!)
            }
        }
        
        let sharingIntent = SwiftReceiveSharingIntentPlugin.instance
        if let url = launchOptions?[UIApplication.LaunchOptionsKey.url] as? URL {
            if url.scheme == "mailto" {
                if let url = handleEmailAndress(open: url) {
                    let corrected = launchOptions!.map { (key, value) in key != .url ? (key, value) : (key, url) }
                    
                    return sharingIntent.application(application, didFinishLaunchingWithOptions: Dictionary(uniqueKeysWithValues: corrected))
                }
            }
        }

        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    override func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        let sharingIntent = SwiftReceiveSharingIntentPlugin.instance
        if sharingIntent.hasMatchingSchemePrefix(url: url) {
            return sharingIntent.application(app, open: url, options: options)
        }
        
        if url.scheme == "mailto" {
            if let url = handleEmailAndress(open: url) {
                return sharingIntent.application(app, open: url, options: options)
            }
        }
        
        return super.application(app, open: url, options:options)
    }
    
    override func applicationDidBecomeActive(_ application: UIApplication) {
        removeAppBadger()
    }
    
    private func handleEmailAndress(open url: URL) -> URL? {
        let appDomain = Bundle.main.bundleIdentifier!
        let appGroupId = (Bundle.main.object(forInfoDictionaryKey: "AppGroupId") as? String) ?? "group.\(Bundle.main.bundleIdentifier!)"
        let sharedKey = "ShareKey"
        var sharedText: [String] = []
        if let email = url.absoluteString.components(separatedBy: ":").last {
            sharedText.append(email)
        }
        let userDefaults = UserDefaults(suiteName: appGroupId)
        userDefaults?.set(sharedText, forKey: sharedKey)
        userDefaults?.synchronize()
        return URL(string: "ShareMedia-\(appDomain)://dataUrl=\(sharedKey)#text")
    }
    
    // Receive displayed notifications for iOS 10 or later devices.
    override func userNotificationCenter(_ center: UNUserNotificationCenter,
                                         willPresent notification: UNNotification,
                                         withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        TwakeLogger.shared.log(message: "AppDelegate::userNotificationCenter::willPresent::notification: \(notification)")
        if let notificationBadgeCount = notification.request.content.badge?.intValue, notificationBadgeCount > 0 {
            let newBadgeCount = UIApplication.shared.applicationIconBadgeNumber + notificationBadgeCount
            TwakeLogger.shared.log(message: "AppDelegate::userNotificationCenter::willPresent:newBadgeCount: \(newBadgeCount)")
            updateAppBadger(currentBadgeCount: newBadgeCount)
        }
        
        completionHandler(isAppForegroundActive() ? [] : [.alert, .badge, .sound])
    }
    
    override func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        updateAppBadger(currentBadgeCount: UIApplication.shared.applicationIconBadgeNumber)
        completionHandler()
    }
}

extension AppDelegate {
    private func updateAppBadger(currentBadgeCount: Int) {
        let newBadgeCount = currentBadgeCount > 0 ? currentBadgeCount - 1 : 0
        TwakeLogger.shared.log(message: "AppDelegate::updateAppBadger::newBadgeCount: \(newBadgeCount)")
        if #available(iOS 16.0, *) {
            UNUserNotificationCenter.current().setBadgeCount(newBadgeCount)
        } else {
            UIApplication.shared.applicationIconBadgeNumber = newBadgeCount
            
        }
    }
    
    private func removeAppBadger() {
        TwakeLogger.shared.log(message: "AppDelegate::removeAppBadger")
        if #available(iOS 16.0, *) {
            UNUserNotificationCenter.current().setBadgeCount(0)
        } else {
            UIApplication.shared.applicationIconBadgeNumber = 0
            
        }
    }
    
    private func isAppForegroundActive() -> Bool {
        return UIApplication.shared.applicationState == .active
    }
}
