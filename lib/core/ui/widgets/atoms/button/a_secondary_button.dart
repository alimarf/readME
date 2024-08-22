import 'package:flutter/material.dart';

import '../../../../utils/size/button_size.dart';
import '../../../colors/colors.dart';
import 'a_primary_button.dart';

// ignore: must_be_immutable
class ASecondaryButton extends StatelessWidget {
  String text;
  Widget? prefixIcon;
  Widget? suffixIcon;
  Color? color;
  Color? borderColor;
  Color? backgroundColor;
  double? elevation;
  double? height;
  double? width;
  double? borderRadius;
  Function? onClick;
  bool? isLoading;
  ButtonSize? size;

  ASecondaryButton(
      {Key? key,
      required this.text,
      this.suffixIcon,
      this.prefixIcon,
      this.color,
      this.borderColor,
      this.backgroundColor,
      this.elevation = 0,
      this.height,
      this.width,
      this.borderRadius,
      this.onClick,
      this.isLoading = false,
      this.size = ButtonSize.Medium})
      : super(key: key) {
    backgroundColor = backgroundColor ?? AppColors.transparent;
    borderColor = borderColor ?? AppColors.primary;
    color = color ?? AppColors.primary;
  }

  @override
  Widget build(BuildContext context) {
    return APrimaryButton(
      text: text,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      color: color,
      borderColor: borderColor,
      backgroundColor: backgroundColor,
      elevation: elevation,
      height: height,
      width: width,
      borderRadius: borderRadius,
      onClick: onClick,
      size: size,
    );
  }
}
