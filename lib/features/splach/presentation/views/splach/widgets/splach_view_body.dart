import 'dart:async';
import 'package:clean_arch_bookly_app/features/home/presentation/view/home/home_view.dart';
import 'package:clean_arch_bookly_app/features/splach/presentation/views/selected-lang/page_selected_lang_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/utils/language/app_lang.dart';
import '../../../../../../core/utils/routes/app_routes.dart';
import '../../../../../auth/presentation/view/wrapper.dart';
import '../../../../../favorite/presentation/manger/favorite_books/favorite_books_cubit.dart';
import '../../../maneg/select_category/select_category_cubit.dart';
import 'custom_splach_logo.dart';
import 'sliding_text.dart';
import 'package:flutter/material.dart';
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
      Timer(const Duration(seconds: 3), () async {
        if (await AppLang.showSelectLang) {
          AppRoutes.goReplace(context, PageSelectedLangView.nameRoute);
        } else {
          // wrapper
          AppRoutes.goReplace(context, WrapperView.nameRoute);
        }
      });
    });
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
