import 'package:flutter/material.dart';

import '../../utils/theme/app_theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.onPressed,
      required this.text,
      required this.backgroundColor,
      required this.borderRadius,
      this.fontSize,
      required this.textColor});
  final void Function()? onPressed;
  final String text;
  final Color backgroundColor;
  final BorderRadius? borderRadius;
  final double? fontSize;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(12))),
      child: Text(
        text,
        style: AppTheme.h6(context)?.copyWith(color: textColor),
      ),
    );
  }
}
