import 'package:clean_arch_bookly_app/core/utils/constant/app_catogre.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../../../../../core/utils/routes/app_routes.dart';
import '../../../categories/view/categories_view.dart';
import '../../../maneg/fetch_category_books/fetch_category_books_cubit.dart';
import 'book_categories_card.dart';

class BookCategoriesViewBody extends StatelessWidget {
  const BookCategoriesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 15.r, vertical: 15.r),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            crossAxisCount: 2,
            mainAxisExtent: 200),
        itemCount: selectedLang.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              context
                  .read<FetchCategoryBooksCubit>()
                  .changeCategoryIndexAndTitle(
                      index, selectedLang.elementAt(index).tr());
              AppRoutes.goMaterial(
                  context,
                  CategoriesView(
                    title: selectedLang.elementAt(index).tr(),
                  ));
            },
            child: BookCategoriesCard(index: index),
          );
        },
      ),
    );
  }
}
