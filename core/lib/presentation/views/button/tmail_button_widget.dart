
import 'package:core/presentation/action/action_callback_define.dart';
import 'package:core/presentation/extensions/color_extension.dart';
import 'package:core/presentation/views/container/tmail_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TMailButtonWidget extends StatelessWidget {

  final OnTapActionCallback? onTapActionCallback;
  final OnTapActionAtPositionCallback? onTapActionAtPositionCallback;

  final double borderRadius;
  final double? width;
  final double maxWidth;
  final double maxHeight;
  final double minWidth;
  final String? tooltipMessage;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final String text;
  final String? icon;
  final bool verticalDirection;
  final double? iconSize;
  final double iconSpace;
  final Color? iconColor;
  final TextStyle? textStyle;
  final String? trailingIcon;
  final double? trailingIconSize;
  final Color? trailingIconColor;
  final List<BoxShadow>? boxShadow;
  final TextAlign? textAlign;
  final bool flexibleText;

  const TMailButtonWidget({
    super.key,
    required this.text,
    this.onTapActionCallback,
    this.onTapActionAtPositionCallback,
    this.borderRadius = 20,
    this.width,
    this.maxWidth = double.infinity,
    this.maxHeight = double.infinity,
    this.minWidth = 0,
    this.tooltipMessage,
    this.backgroundColor,
    this.padding,
    this.verticalDirection = false,
    this.icon,
    this.iconSize,
    this.iconColor,
    this.textStyle,
    this.iconSpace = 8,
    this.trailingIcon,
    this.trailingIconSize,
    this.trailingIconColor,
    this.boxShadow,
    this.margin,
    this.textAlign,
    this.flexibleText = false,
  });

  factory TMailButtonWidget.fromIcon({
    required String icon,
    final Key? key,
    OnTapActionCallback? onTapActionCallback,
    OnTapActionAtPositionCallback? onTapActionAtPositionCallback,
    double borderRadius = 20,
    double? width,
    double maxWidth = double.infinity,
    double maxHeight = double.infinity,
    double minWidth = 0,
    String? tooltipMessage,
    Color? backgroundColor,
    EdgeInsetsGeometry? padding,
    String text = '',
    bool verticalDirection = false,
    double? iconSize,
    Color? iconColor,
    TextStyle? textStyle,
    double iconSpace = 8,
    String? trailingIcon,
    double? trailingIconSize,
    Color? trailingIconColor,
    List<BoxShadow>? boxShadow,
    EdgeInsetsGeometry? margin,
    TextAlign? textAlign,
    bool flexibleText = false,
  }) {
    return TMailButtonWidget(
      key: key,
      text: text,
      onTapActionCallback: onTapActionCallback,
      onTapActionAtPositionCallback: onTapActionAtPositionCallback,
      borderRadius: borderRadius,
      width: width,
      maxWidth : maxWidth,
      maxHeight: maxHeight,
      minWidth: minWidth,
      tooltipMessage: tooltipMessage,
      backgroundColor: backgroundColor,
      padding: padding,
      verticalDirection: verticalDirection,
      icon: icon,
      iconSize: iconSize,
      iconColor: iconColor,
      textStyle: textStyle,
      iconSpace: iconSpace,
      trailingIcon: trailingIcon,
      trailingIconSize: trailingIconSize,
      trailingIconColor: trailingIconColor,
      boxShadow: boxShadow,
      margin: margin,
      textAlign: textAlign,
      flexibleText: flexibleText,
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget childWidget;

    if (icon != null && text.isNotEmpty) {
      if (verticalDirection) {
        childWidget = Column(
          children: [
            SvgPicture.asset(
              icon!,
              width: iconSize,
              height: iconSize,
              fit: BoxFit.fill,
              colorFilter: iconColor?.asFilter()
            ),
            SizedBox(height: iconSpace),
            Text(
              text,
              textAlign: textAlign,
              style: textStyle ?? const TextStyle(
                fontSize: 12,
                color: AppColor.colorTextButtonHeaderThread
              ),
            ),
            if (trailingIcon != null)
              Padding(
                padding: EdgeInsetsDirectional.only(top: iconSpace),
                child: SvgPicture.asset(
                  trailingIcon!,
                  width: trailingIconSize,
                  height: trailingIconSize,
                  fit: BoxFit.fill,
                  colorFilter: trailingIconColor?.asFilter()
                ),
              ),
          ]
        );
      } else {
        childWidget = Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon!,
              width: iconSize,
              height: iconSize,
              fit: BoxFit.fill,
              colorFilter: iconColor?.asFilter()
            ),
            SizedBox(width: iconSpace),
            if (flexibleText)
              Flexible(
                child: Text(
                  text,
                  textAlign: textAlign,
                  style: textStyle ?? const TextStyle(
                    fontSize: 12,
                    color: AppColor.colorTextButtonHeaderThread
                  ),
                ),
              )
            else
              Text(
                text,
                textAlign: textAlign,
                style: textStyle ?? const TextStyle(
                  fontSize: 12,
                  color: AppColor.colorTextButtonHeaderThread
                ),
              ),
            if (trailingIcon != null)
              Padding(
                padding: EdgeInsetsDirectional.only(start: iconSpace),
                child: SvgPicture.asset(
                  trailingIcon!,
                  width: trailingIconSize,
                  height: trailingIconSize,
                  fit: BoxFit.fill,
                  colorFilter: trailingIconColor?.asFilter()
                ),
              ),
          ]
        );
      }
    } else if (icon != null) {
      childWidget = SvgPicture.asset(
        icon!,
        width: iconSize,
        height: iconSize,
        fit: BoxFit.fill,
        colorFilter: iconColor?.asFilter()
      );
    } else {
      childWidget = Text(
        text,
        textAlign: textAlign,
        style: textStyle ?? const TextStyle(
          fontSize: 12,
          color: AppColor.colorTextButtonHeaderThread
        ),
      );
    }

    return TMailContainerWidget(
      onTapActionCallback: onTapActionCallback,
      onTapActionAtPositionCallback: onTapActionAtPositionCallback,
      borderRadius: borderRadius,
      width: width,
      maxWidth: maxWidth,
      maxHeight: maxHeight,
      minWidth: minWidth,
      tooltipMessage: tooltipMessage,
      backgroundColor: backgroundColor,
      padding: padding,
      margin: margin,
      boxShadow: boxShadow,
      child: childWidget,
    );
  }
}