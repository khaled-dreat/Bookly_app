import 'dart:developer';

import 'package:clean_arch_bookly_app/core/utils/constant/app_catogre.dart';
import 'package:clean_arch_bookly_app/core/utils/routes/app_routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../category/presentation/categories/view/categories_view.dart';
import '../../../../../category/presentation/maneg/fetch_category_books/fetch_category_books_cubit.dart';
import '../../../../../splach/presentation/maneg/select_category/select_category_cubit.dart';
import 'swipeable_view.dart';
import 'featured_books_list_view_bloc.dart';
import 'section_headar.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<SelectCategoryCubit>().getSelectedCategory();
  }

  @override
  Widget build(BuildContext context) {
    List<String> selectedCategoryList =
        context.read<SelectCategoryCubit>().itemSelected;

    return PopScope(
      canPop: false,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.verticalSpace,
                  // * Swipeable
                  const Swipeable(),
                  // * Space
                  15.verticalSpace,
                  // ? ********************* Selected Category Index 0 *********************
                  // * SectionH eadar
                  SectionHeadar(
                      title: selectedCategoryList[0].tr(),
                      onPressed: () {
                        context
                            .read<FetchCategoryBooksCubit>()
                            .changeCategoryIndexAndTitle(
                                selectedCategoryList
                                    .indexOf(selectedCategoryList[0]),
                                selectedCategoryList[0].tr());
                        AppRoutes.goMaterial(
                            context,
                            CategoriesView(
                              title: selectedCategoryList[0].tr(),
                            ));
                      }),
                  // * List View Books Bloc Builder
                  FeaturedBooksListViewBlocIndex1(
                      categoryTitle: selectedCategoryList[0].tr(),
                      listCategoryIndex: selectedCategoryList
                          .indexOf(selectedCategoryList[0])),
                  // * Space
                  15.verticalSpace,
                  // ? ********************* Selected Category Index 1 *********************
                  // * SectionH eadar
                  SectionHeadar(
                      title: selectedCategoryList[1].tr(),
                      onPressed: () {
                        context
                            .read<FetchCategoryBooksCubit>()
                            .changeCategoryIndexAndTitle(
                                selectedCategoryList
                                    .indexOf(selectedCategoryList[1]),
                                selectedCategoryList[1].tr());
                        AppRoutes.goMaterial(
                            context,
                            CategoriesView(
                              title: selectedCategoryList[1].tr(),
                            ));
                      }),
                  // * List View Books Bloc Builder
                  FeaturedBooksListViewBlocIndex2(
                      categoryTitle: selectedCategoryList[1].tr(),
                      listCategoryIndex: selectedCategoryList
                          .indexOf(selectedCategoryList[1])),
                  // * Space
                  15.verticalSpace,
                  // ? ********************* Selected Category Index 2 *********************
                  // * SectionH eadar
                  SectionHeadar(
                      title: selectedCategoryList[2].tr(),
                      onPressed: () {
                        context
                            .read<FetchCategoryBooksCubit>()
                            .changeCategoryIndexAndTitle(
                                selectedCategoryList
                                    .indexOf(selectedCategoryList[2]),
                                selectedCategoryList[2].tr());
                        AppRoutes.goMaterial(
                            context,
                            CategoriesView(
                              title: selectedCategoryList[2].tr(),
                            ));
                      }),
                  // * List View Books Bloc Builder
                  FeaturedBooksListViewBlocIndex3(
                      categoryTitle: selectedCategoryList[2].tr(),
                      listCategoryIndex: selectedCategoryList
                          .indexOf(selectedCategoryList[2])),
                  // * Space
                  30.verticalSpace,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
