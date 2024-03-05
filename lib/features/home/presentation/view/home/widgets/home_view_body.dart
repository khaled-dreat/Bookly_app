import 'package:clean_arch_bookly_app/core/utils/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../category/presentation/categories/manger/fetch_category_books/fetch_category_books_cubit.dart';
import '../../../../../category/presentation/categories/view/categories_view.dart';
import '../../../../../splach/presentation/maneg/select_category/select_category_cubit.dart';
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
        context.read<SelectCategoryCubit>().itemCount;
    return PopScope(
      canPop: false,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // * AppBar
                  //   const CoustomAppBar(),
                  // * Space
                  15.verticalSpace,
                  // ? ********************* Selected Category Index 0 *********************
                  // * SectionH eadar
                  SectionHeadar(
                      title: selectedCategoryList[0],
                      onPressed: () {
                        context
                            .read<FetchCategoryBooksCubit>()
                            .changeCategoryIndexAndTitle(
                                selectedCategoryList
                                    .indexOf(selectedCategoryList[0]),
                                selectedCategoryList[0]);
                        AppRoutes.goMaterial(
                            context,
                            CategoriesView(
                              title: selectedCategoryList[0],
                            ));
                      }),
                  // * List View Books Bloc Builder
                  FeaturedBooksListViewBlocIndex1(
                      categoryTitle: selectedCategoryList[0],
                      listCategoryIndex: selectedCategoryList
                          .indexOf(selectedCategoryList[0])),
                  // * Space
                  15.verticalSpace,
                  // ? ********************* Selected Category Index 1 *********************
                  // * SectionH eadar
                  SectionHeadar(
                      title: selectedCategoryList[1],
                      onPressed: () {
                        context
                            .read<FetchCategoryBooksCubit>()
                            .changeCategoryIndexAndTitle(
                                selectedCategoryList
                                    .indexOf(selectedCategoryList[1]),
                                selectedCategoryList[1]);
                        AppRoutes.goMaterial(
                            context,
                            CategoriesView(
                              title: selectedCategoryList[1],
                            ));
                      }),
                  // * List View Books Bloc Builder
                  FeaturedBooksListViewBlocIndex2(
                      categoryTitle: selectedCategoryList[1],
                      listCategoryIndex: selectedCategoryList
                          .indexOf(selectedCategoryList[1])),
                  // * Space
                  15.verticalSpace,
                  // ? ********************* Selected Category Index 2 *********************
                  // * SectionH eadar
                  SectionHeadar(
                      title: selectedCategoryList[2],
                      onPressed: () {
                        context
                            .read<FetchCategoryBooksCubit>()
                            .changeCategoryIndexAndTitle(
                                selectedCategoryList
                                    .indexOf(selectedCategoryList[2]),
                                selectedCategoryList[2]);
                        AppRoutes.goMaterial(
                            context,
                            CategoriesView(
                              title: selectedCategoryList[2],
                            ));
                      }),
                  // * List View Books Bloc Builder
                  FeaturedBooksListViewBlocIndex3(
                      categoryTitle: selectedCategoryList[2],
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
