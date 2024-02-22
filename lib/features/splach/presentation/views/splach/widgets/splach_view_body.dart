import 'dart:async';
import 'dart:developer';

import 'package:clean_arch_bookly_app/core/utils/constant/app_images.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/view/home/home_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../../../core/utils/local_data/app_local_data_key.dart';
import '../../../../../../core/utils/routes/app_routes.dart';
import '../../../../../auth/presentation/view/wrapper.dart';
import '../../../../../favorite/presentation/manger/favorite_books/favorite_books_cubit.dart';
import '../../../../../home/domain/entity/book_entity.dart';
import '../../../maneg/select_category/select_category_cubit.dart';
import 'custom_splach_logo.dart';
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
    Timer(const Duration(seconds: 3), () async {
      context.read<SelectCategoryCubit>().getSelectedCategory();
      context.read<FavoriteBooksCubit>().getFavoriteBooks();
      Future.delayed(const Duration(seconds: 3), () {
        if (context.read<SelectCategoryCubit>().itemCount.isNotEmpty) {
          AppRoutes.goReplace(context, WrapperView.nameRoute);
        } else {
          AppRoutes.goReplace(context, SelectCategoryView.nameRoute);
        }
      });
    });

    // navigateToHome();
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
        const CustomSplachLogo(),
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
    context.read<FavoriteBooksCubit>().getFavoriteBooks();
    Future.delayed(const Duration(seconds: 3), () {
      if (context.read<SelectCategoryCubit>().itemCount.isNotEmpty) {
        AppRoutes.goReplace(context, HomeView.nameRoute);
      } else {
        AppRoutes.goReplace(context, SelectCategoryView.nameRoute);
      }
    });
  }
}
