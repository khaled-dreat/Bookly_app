import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../utils/theme/app_color.dart';
import '../../utils/theme/app_theme.dart';

class ErrorText extends StatelessWidget {
  const ErrorText({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: AppTheme.h6(context),
      ).tr(),
    );
  }
}
