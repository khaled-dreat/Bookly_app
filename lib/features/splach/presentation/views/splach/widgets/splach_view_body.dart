import 'package:clean_arch_bookly_app/features/home/presentation/view/home/home_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/routes/app_routes.dart';
import '../../../maneg/select_category/select_category_cubit.dart';
import 'sliding_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/dime/app_dime.dart';
import '../../select_category/select_category_view.dart';

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
        Image.asset(
          "assets/img/Grey Minimalist Bookstore Business Logo (1).png",
          width: 100.w,
        ),
        // * Space
        // AppDime..verticalSpace,
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
        Tween<Offset>(begin: const Offset(0, 10), end: Offset.zero)
            .animate(animatedContainer);
    animatedContainer.forward();
  }

  // * Go To Home
  void navigateToHome() {
    context.read<SelectCategoryCubit>().getSelectedCategory();
    Future.delayed(const Duration(seconds: 3), () {
      if (context.read<SelectCategoryCubit>().itemCount.isNotEmpty) {
        AppRoutes.goReplace(context, HomeView.nameRoute);
      } else {
        AppRoutes.goReplace(context, SelectCategoryView.nameRoute);
      }
    });
  }
}
