import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../utils/dime/app_dime.dart';
import '../../utils/theme/app_color.dart';
import '../../utils/theme/app_theme.dart';

enum TypeLoading { profile, image, page, webview, send }

class AppLoading extends StatefulWidget {
  const AppLoading({super.key, this.loading, this.size});
  final TypeLoading? loading;
  final double? size;

  @override
  State<AppLoading> createState() => _AppLoadingState();
}

class _AppLoadingState extends State<AppLoading> {
  @override
  Widget build(BuildContext context) {
    switch (widget.loading ?? TypeLoading.image) {
      // * image
      case TypeLoading.image:
        return LoadingAnimationWidget.fourRotatingDots(
            color: colorLoading, size: sizeLoading);
      // * profile
      case TypeLoading.profile:
        return LoadingAnimationWidget.discreteCircle(
          color: colorLoading,
          size: sizeLoading,
        );
      // * page
      case TypeLoading.page:
        return LoadingAnimationWidget.inkDrop(
            color: colorLoading, size: sizeLoading);

      // * webview
      case TypeLoading.webview:
        return LoadingAnimationWidget.twistingDots(
          leftDotColor: colorLoading,
          rightDotColor: colorLoadingRight,
          size: sizeLoading,
        );

      // * send
      case TypeLoading.send:
        return LoadingAnimationWidget.dotsTriangle(
            color: colorLoading, size: sizeLoading);
    }
  }

  // * Color
  Color get colorLoading =>
      AppTheme.isDark(context) ? AppColors.darkLoading : AppColors.lightLoading;
  Color get colorLoadingRight =>
      AppTheme.isDark(context) ? AppColors.lightLoading : AppColors.darkLoading;

  // * Size
  double get sizeLoading => (widget.size ?? AppDime.xxl / AppDime.one_41).r;
}
