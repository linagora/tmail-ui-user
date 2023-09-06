
import 'package:core/presentation/extensions/color_extension.dart';
import 'package:flutter/material.dart';

class RecipientComposerWidgetStyle {
  static const double deleteRecipientFieldIconSize = 20;
  static const double space = 8;

  static const Color borderColor = AppColor.colorLineComposer;
  static const Color deleteRecipientFieldIconColor = AppColor.colorCollapseMailbox;

  static const EdgeInsetsGeometry deleteRecipientFieldIconPadding = EdgeInsetsDirectional.all(3);
  static const EdgeInsetsGeometry prefixButtonPadding = EdgeInsetsDirectional.symmetric(vertical: 3, horizontal: 5);
  static const EdgeInsetsGeometry labelMargin = EdgeInsetsDirectional.only(top: 16);
  static const EdgeInsetsGeometry recipientMargin = EdgeInsetsDirectional.only(top: 12);

  static const TextStyle prefixButtonTextStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.underline,
    color: AppColor.colorPrefixButtonComposer
  );
  static const TextStyle labelTextStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColor.colorLabelComposer
  );
  static const TextStyle inputTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.black
  );
}