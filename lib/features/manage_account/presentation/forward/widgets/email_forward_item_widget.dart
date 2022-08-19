import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tmail_ui_user/features/manage_account/presentation/forward/forward_controller.dart';

class EmailForwardItemWidget extends StatelessWidget {
  final _responsiveUtils = Get.find<ResponsiveUtils>();
  final _imagePaths = Get.find<ImagePaths>();
  final _emailForwardController = Get.find<ForwardController>();

  final String emailAddress;

  EmailForwardItemWidget({
    Key? key,
    required this.emailAddress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
        bottom: 15,
        left: _responsiveUtils.isMobile(context) ? 16 : 24,
        right: _responsiveUtils.isMobile(context) ? 8 : 24
      ),
      color: Colors.white,
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Text(emailAddress,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.black)),
        const Spacer(),
        buildIconWeb(
            icon: SvgPicture.asset(
              _imagePaths.icDeleteEmailForward,
              fit: BoxFit.fill,
            ),
            onTap: () {
              _emailForwardController.deleteRecipients(context, emailAddress);
            }),
      ]),
    );
  }
}
