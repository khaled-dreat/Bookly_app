import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/dime/app_dime.dart';
import '../../../../../core/utils/theme/app_color.dart';
import '../../../../../core/utils/theme/app_theme.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({
    super.key,
    this.height,
    required this.title,
    required this.onTap,
  });

  final double? height;
  final String title;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: AppTheme.isDark(context)
          ? AppColors.splashBtnDark
          : AppColors.splashBtnLight,
      borderRadius: BorderRadius.circular(AppDime.xxl.r),
      child: Container(
        width: AppDime.fullScreen.sw,
        height: height ?? AppDime.heightBtn.h,
        margin: EdgeInsets.symmetric(
          horizontal: AppDime.md.r,
          vertical: AppDime.md.r,
        ),
        padding: EdgeInsets.zero,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(AppDime.xxl.r),
          gradient: LinearGradient(
            colors: AppTheme.isDark(context)
                ? AppColors.btnColorsDark
                : AppColors.btnColorsLight,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          title.toUpperCase(),
          style: AppTheme.h6(context)?.copyWith(color: AppColors.bgWhite),
        ),
      ),
    );
  }
}
