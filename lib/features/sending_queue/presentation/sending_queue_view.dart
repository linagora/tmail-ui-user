
import 'package:core/presentation/extensions/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:tmail_ui_user/features/base/mixin/app_loader_mixin.dart';
import 'package:tmail_ui_user/features/base/widget/compose_floating_button.dart';
import 'package:tmail_ui_user/features/email/presentation/model/composer_arguments.dart';
import 'package:tmail_ui_user/features/sending_queue/presentation/sending_queue_controller.dart';
import 'package:get/get.dart';
import 'package:tmail_ui_user/features/sending_queue/presentation/widgets/app_bar_sending_queue_widget.dart';
import 'package:tmail_ui_user/features/sending_queue/presentation/widgets/banner_message_sending_queue_widget.dart';
import 'package:tmail_ui_user/features/sending_queue/presentation/widgets/sending_email_tile_widget.dart';

class SendingQueueView extends GetWidget<SendingQueueController> with AppLoaderMixin {

  const SendingQueueView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: SafeArea(
          child: Column(
            children: [
              AppBarSendingQueueWidget(onOpenMailboxMenu: controller.openMailboxMenu),
              const Divider(color: AppColor.colorDividerComposer, height: 1),
              const BannerMessageSendingQueueWidget(),
              Expanded(child: _buildListSendingEmails(context))
            ]
          ),
        ),
      ),
      floatingActionButton: ComposeFloatingButton(
        scrollController: controller.listSendingEmailController,
        onTap: () => controller.dashboardController!.goToComposer(ComposerArguments())
      ),
    );
  }

  Widget _buildListSendingEmails(BuildContext context) {
    return Obx(() {
      if (controller.dashboardController!.listSendingEmails.isNotEmpty) {
        return ListView.builder(
          controller: controller.listSendingEmailController,
          padding: EdgeInsets.zero,
          itemCount: controller.dashboardController!.listSendingEmails.length,
          itemBuilder: (context, index) => SendingEmailTileWidget(
            sendingEmail: controller.dashboardController!.listSendingEmails[index]
          )
        );
      } else {
        return const SizedBox.shrink();
      }
    });
  }
}