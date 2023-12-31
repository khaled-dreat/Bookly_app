import 'package:clean_arch_bookly_app/core/utils/constant/app_images.dart';
import 'package:clean_arch_bookly_app/core/utils/routes/app_routes.dart';
import 'package:clean_arch_bookly_app/features/splach/presentation/views/splach/widgets/sliding_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/dime/app_dime.dart';
import '../../../../../home/presentation/view/home/home_view.dart';

class SplachViewBody extends StatefulWidget {
  const SplachViewBody({super.key});

  @override
  State<SplachViewBody> createState() => _SplachViewBodyState();
}

class _SplachViewBodyState extends State<SplachViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animatedContainer;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();
    animatedContainer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // * image
        Image.asset(AppImages.appIcon),
        // * Space
        AppDime.lg.verticalSpace,
        // * Sliding Text
        SlidingText(slidingAnimation: slidingAnimation)
      ],
    );
  }

// * initState SlidingA nimation
  void initSlidingAnimation() {
    animatedContainer =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 12), end: Offset.zero)
            .animate(animatedContainer);
    animatedContainer.forward();
  }

  // * Go To Home
  void navigateToHome() {
    Future.delayed(const Duration(seconds: 3), () {
      AppRoutes.goReplace(context, HomeView.nameRoute);
    });
  }
}
