import 'package:clean_arch_bookly_app/core/utils/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class AppSnackBar {
  // ✅
  static void snackBarSuccess({required String msg}) {
    showTopSnackBar(
      OverlayState(),
      CustomSnackBar.success(
        message: msg,
        backgroundColor: AppColors.lightModeSnack,

        // TODO :  AppTheme.isDark(context)
        // *   ? AppColors.darkModeSnack
        textStyle: TextStyle(
          color: AppColors.bgBlack,
          fontWeight: FontWeight.bold,
        ),
      ),
      displayDuration: const Duration(seconds: 1),
    );
  }

  // * ❌
  static void snackBarError({required String msg}) {
    showTopSnackBar(
      OverlayState(),
      CustomSnackBar.error(message: msg),
      displayDuration: const Duration(seconds: 1),
    );
  }
}
