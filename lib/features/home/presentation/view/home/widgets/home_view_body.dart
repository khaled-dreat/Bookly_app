import 'package:clean_arch_bookly_app/features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/manger/new_books_cubit/new_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/theme/app_theme.dart';
import 'newes_seller_list_view.dart';
import 'coustom_appbar.dart';
import 'featured_books_list_view_bloc_consumer.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
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
                // * List View Books Bloc Consumer
                const FeaturedBooksListViewBlocConsumer(),
                // * Space
                15.verticalSpace,
                // * Best Slear Text
                Text(
                  "أفضل الاسعار",
                  style: AppTheme.h5(context),
                ), // * Space
                15.verticalSpace,
              ],
            ),
          ),
        ),
        // * Best Seller Books List View
        SliverFillRemaining(
          child: BlocBuilder<NewestBooksCubit, NewestBooksState>(
              builder: (context, state) {
            if (state is NewestBooksSuccess) {
              return NewestSellerListView(
                books: state.books,
              );
            } else if (state is NewestBooksFailure) {
              return Text(state.errMessage);
            } else {
              return const CircularProgressIndicator();
            }
          }),
        )
      ],
    );
  }
}
// * List View Books Bloc Bilder
