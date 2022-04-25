
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmail_ui_user/features/mailbox_dashboard/presentation/mixin/user_setting_popup_menu_mixin.dart';
import 'package:tmail_ui_user/features/manage_account/presentation/content/manage_account_content_view.dart';
import 'package:tmail_ui_user/features/manage_account/presentation/dashboard/manage_account_dashboard_controller.dart';
import 'package:tmail_ui_user/features/manage_account/presentation/menu/manage_account_menu_view.dart';
import 'package:tmail_ui_user/main/localizations/app_localizations.dart';
import 'package:tmail_ui_user/main/routes/route_navigation.dart';

class ManageAccountDashBoardView extends GetWidget<ManageAccountDashBoardController> with
  UserSettingPopupMenuMixin {

  final _responsiveUtils = Get.find<ResponsiveUtils>();
  final _imagePaths = Get.find<ImagePaths>();

  ManageAccountDashBoardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (controller.isMenuDrawerOpen && _responsiveUtils.isDesktop(context)) {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        controller.closeMenuDrawer();
      });
    }

    return Scaffold(
      key: controller.menuDrawerKey,
      backgroundColor: Colors.white,
      drawer: ResponsiveWidget(
          responsiveUtils: _responsiveUtils,
          mobile: SizedBox(child: ManageAccountMenuView(), width: _responsiveUtils.defaultSizeDrawerWidthWeb),
          desktop: const SizedBox.shrink()
      ),
      drawerEnableOpenDragGesture: !_responsiveUtils.isDesktop(context),
      body: Stack(children: [
        ResponsiveWidget(
            responsiveUtils: _responsiveUtils,
            desktop: Column(children: [
              Row(children: [
                Container(width: 256, color: Colors.white,
                    padding: const EdgeInsets.only(top: 25, bottom: 25, left: 32),
                    child: Row(children: [
                      (SloganBuilder(arrangedByHorizontal: true)
                        ..setSloganText(AppLocalizations.of(context).app_name)
                        ..setSloganTextAlign(TextAlign.center)
                        ..setSloganTextStyle(const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold))
                        ..setSizeLogo(24)
                        ..setLogo(_imagePaths.icLogoTMail))
                      .build(),
                      Obx(() {
                        if (controller.appInformation.value != null) {
                          return Padding(padding: const EdgeInsets.only(top: 6),
                              child: Text(
                                'v.${controller.appInformation.value!.version}',
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 13, color: AppColor.colorContentEmail, fontWeight: FontWeight.w500),
                              ));
                        } else {
                          return const SizedBox.shrink();
                        }
                      }),
                    ])
                ),
                Expanded(child: Padding(
                    padding: const EdgeInsets.only(right: 10, top: 16, bottom: 10, left: 48),
                    child: _buildRightHeader(context)))
              ]),
              Expanded(child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(child: ManageAccountMenuView(), width: _responsiveUtils.defaultSizeMenuWidthWeb),
                  const Expanded(child: ManageAccountContentView())
                ],
              ))
            ]),
            mobile: const ManageAccountContentView()
        ),
      ]),
    );
  }

  Widget _buildRightHeader(BuildContext context) {
    return Row(children: [
      const Spacer(),
      (SearchBarView(_imagePaths)
        ..hintTextSearch(AppLocalizations.of(context).search_emails)
        ..maxSizeWidth(240)
        ..addOnOpenSearchViewAction(() => {}))
      .build(),
      const SizedBox(width: 16),
      (AvatarBuilder()
          ..text(controller.userProfile.value?.getAvatarText() ?? '')
          ..backgroundColor(Colors.white)
          ..textColor(Colors.black)
          ..context(context)
          ..addOnTapAvatarActionWithPositionClick((position) =>
              controller.openPopupMenuAction(context, position, popupMenuUserSettingActionTile(context,
                  controller.userProfile.value,
                  onLogoutAction: () => controller.logoutAction(),
                  onSettingAction: ()  {
                    popBack();
                    controller.goToSettings();
                  })))
          ..addBoxShadows([const BoxShadow(
              color: AppColor.colorShadowBgContentEmail,
              spreadRadius: 1, blurRadius: 1, offset: Offset(0, 0.5))])
          ..size(48))
        .build(),
      const SizedBox(width: 16)
    ]);
  }
}