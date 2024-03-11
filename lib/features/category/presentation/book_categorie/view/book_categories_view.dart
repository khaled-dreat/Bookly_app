import 'package:clean_arch_bookly_app/core/utils/theme/app_color.dart';
import 'package:clean_arch_bookly_app/core/utils/theme/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../core/utils/constant/app_catogre.dart';
import '../../../../../core/widgets/images/costom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class BookCategoriesView extends StatelessWidget {
  static const String nameRoute = "BookCategoriesView";
  const BookCategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: const Scaffold(
        body: BookCategoriesViewBody(),
      ),
    );
  }
}

class BookCategoriesViewBody extends StatelessWidget {
  const BookCategoriesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            crossAxisCount: 2,
            mainAxisExtent: 200),
        itemCount: selectedLang.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AppColors.bgWhite,
                  borderRadius: const BorderRadius.all(Radius.circular(25))),
              child: Text(
                selectedLang.elementAt(index).tr(),
                textAlign: TextAlign.center,
                style: AppTheme.h5(context)!
                    .copyWith(color: AppColors.primaryColor),
              ));
        },
      ),
    );
  }
}
