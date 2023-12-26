import 'package:clean_arch_bookly_app/features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:clean_arch_bookly_app/features/search/domain/entity/srh_book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/theme/app_theme.dart';
import '../../../../../../core/widgets/snackbar/snackbar.dart';
import '../../../manger/srh_books/srh_books_cubit.dart';
import 'custom_search_text_field.dart';
import 'search_result_list_view.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.r),
      child: Column(
        children: [
          // * Custom Search Text Field
          const CustomSearchTextField(),
          // * Space
          16.verticalSpace,
          // * Search Result Text
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "نتأج البحث",
              style: AppTheme.h5(context),
            ),
          ),
          // * Space
          16.verticalSpace,
          // * Search Result List View
          const Expanded(
            child: FeaturedBooksListViewBlocBuilder(),
          ),
        ],
      ),
    );
  }
}

class FeaturedBooksListViewBlocBuilder extends StatefulWidget {
  const FeaturedBooksListViewBlocBuilder({
    super.key,
  });

  @override
  State<FeaturedBooksListViewBlocBuilder> createState() =>
      _FeaturedBooksListViewBlocBuilderState();
}

class _FeaturedBooksListViewBlocBuilderState
    extends State<FeaturedBooksListViewBlocBuilder> {
  List<SrhBookEntity> books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SrhBooksCubit, SrhBooksState>(
        listener: (context, state) {
      if (state is SrhBooksSuccess) {
        books.addAll(state.books);
      }
      if (state is SrhBooksPaginationFailure) {
        ScaffoldMessenger.of(context).showSnackBar(
          buildErrorWidget(state.errorMessage),
        );
      }
    }, builder: (context, state) {
      if (state is SrhBooksSuccess ||
          state is SrhBooksPaginationLoading ||
          state is SrhBooksPaginationFailure) {
        return SearchResultListView(
          books: books,
        );
      } else if (state is SrhBooksFailure) {
        return Text("data");
      }
      return CircularProgressIndicator();
    });
  }
}
