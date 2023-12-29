import 'package:clean_arch_bookly_app/features/search/presentation/views/search/widgets/featured_books_list_view_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/theme/app_theme.dart';
import '../../../../../home/presentation/view/home/widgets/featured_books_list_view_bloc_consumer.dart';
import 'custom_search_text_field.dart';

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
            child: FeaturedSrhBooksListViewBlocConsumer(),
          ),
        ],
      ),
    );
  }
}
