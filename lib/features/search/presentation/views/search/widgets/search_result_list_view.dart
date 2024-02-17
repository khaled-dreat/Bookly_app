import '../../../../domain/entity/srh_book_entity.dart';
import '../../../manger/srh_books/srh_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/theme/app_theme.dart';
import 'custom_listview_srh_result.dart';

class SearchResultListView extends StatefulWidget {
  const SearchResultListView({super.key, required this.books});
  final List<SrhBookEntity> books;

  @override
  State<SearchResultListView> createState() => _SearchResultListViewState();
}

class _SearchResultListViewState extends State<SearchResultListView> {
  late ScrollController scrollController;
  late TextEditingController searchController;
  int nextPage = 1;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    searchController = TextEditingController();
    scrollController.addListener(scrollListener);
  }

  void scrollListener() async {
    double currentPositions = scrollController.position.pixels;
    double maxScrollLength = scrollController.position.maxScrollExtent;
    if (currentPositions >= 0.7 * maxScrollLength) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<SrhBooksCubit>(context)
            .fetchFeaturedSrhBooks(pageNumber: nextPage++);
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // * Search Result Text
        16.verticalSpace,
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "نتأج البحث",
            style: AppTheme.h5(context),
          ),
        ),
        // * Space
        16.verticalSpace,
        Expanded(
          child: CustomListviewSrhResult(
              scrollController: scrollController, books: widget.books),
        ),
      ],
    );
  }
}
