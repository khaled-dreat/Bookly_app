// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/theme/app_theme.dart';
import '../../../../../splach/presentation/maneg/select_category/select_category_cubit.dart';
import '../../../manger/fetch_new_books_cubit/fetch_new_books_cubit.dart';
import 'coustom_appbar.dart';
import 'featured_books_list_view_bloc.dart';
import 'newes_seller_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> SelectedCategoryList =
        context.read<SelectCategoryCubit>().itemCount;
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // * AppBar
                const CoustomAppBar(),
                // * Space
                15.verticalSpace,
                SectionHeadar(title: SelectedCategoryList[0]),
                // * List View Books Bloc Builder
                FeaturedBooksListViewBlocIndex1(
                    categoryTitle: SelectedCategoryList[0],
                    listCategoryIndex:
                        SelectedCategoryList.indexOf(SelectedCategoryList[0])),
                // * Space
                15.verticalSpace,

                // * List View Books Bloc Builder
                SectionHeadar(title: SelectedCategoryList[1]),
                FeaturedBooksListViewBlocIndex2(
                    categoryTitle: SelectedCategoryList[1],
                    listCategoryIndex:
                        SelectedCategoryList.indexOf(SelectedCategoryList[1])),
                // * Space
                15.verticalSpace,

                // * List View Books Bloc Builder
                SectionHeadar(title: SelectedCategoryList[2]),
                FeaturedBooksListViewBlocIndex3(
                    categoryTitle: SelectedCategoryList[2],
                    listCategoryIndex:
                        SelectedCategoryList.indexOf(SelectedCategoryList[2])),
                // * Space
                15.verticalSpace,
                // * Best Slear Text
                15.verticalSpace,
              ],
            ),
          ),
        ),
        // * Best Seller Books List View
        //   SliverFillRemaining(
        //     child: BlocBuilder<NewestBooksCubit, NewestBooksState>(
        //         builder: (context, state) {
        //       if (state is NewestBooksSuccess) {
        //         return NewestSellerListView(
        //           books: state.books,
        //         );
        //       } else if (state is NewestBooksFailure) {
        //         return Text(state.errMessage);
        //       } else {
        //         return const CircularProgressIndicator();
        //       }
        //     }),
        //   )
      ],
    );
  }
}

class SectionHeadar extends StatelessWidget {
  const SectionHeadar({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTheme.h5(context),
        ),
        IconButton(
            onPressed: () {},
            icon: Icon(Icons.keyboard_double_arrow_right_outlined))
      ],
    );
  }
}
