import 'package:fcm/model/firebase_subscription.dart';
import 'package:fcm/model/type_name.dart';
import 'package:jmap_dart_client/jmap/account_id.dart';
import 'package:jmap_dart_client/jmap/core/properties/properties.dart';
import 'package:model/fcm/fcm_token_dto.dart';
import 'package:tmail_ui_user/features/thread/domain/model/email_response.dart';
import 'package:jmap_dart_client/jmap/core/state.dart' as jmap;

abstract class FCMRepository {
  Future<FCMTokenDto> getFCMToken(String accountId);

  Future<void> setFCMToken(FCMTokenDto fcmTokenDto);

  Future<void> deleteFCMToken(String accountId);

  Future<EmailsResponse> getEmailChangesToPushNotification(
    AccountId accountId,
    jmap.State currentState,
    {
      Properties? propertiesCreated,
      Properties? propertiesUpdated
    }
  );

  Future<bool> storeStateToRefresh(TypeName typeName, jmap.State newState);

  Future<jmap.State> getStateToRefresh(TypeName typeName);

  Future<bool> deleteStateToRefresh(TypeName typeName);

  Future<bool> storeDeviceId(String deviceId);

  Future<FirebaseSubscription> getFirebaseSubscriptionByDeviceId(String deviceId);
}