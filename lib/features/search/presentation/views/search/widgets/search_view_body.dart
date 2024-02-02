import 'package:clean_arch_bookly_app/features/search/presentation/views/search/widgets/featured_books_list_view_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/theme/app_theme.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  late TextEditingController searchController;
  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
        // BlocProvider.of<SrhBooksCubit>(context).srhKey!.isNotEmpty
        //     ?
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.r),
            child: Column(
              children: [
                // * Space
                15.verticalSpace,
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
                // ?
                const Expanded(
                  child: FeaturedSrhBooksListViewBlocConsumer(),
                )
              ],
            ))
        //  : Center(
        //      child: SizedBox(
        //          height: 400.h,
        //          width: 350.w,
        //          child: SvgPicture.asset(
        //              "assets/svg/undraw_searching_re_3ra9.svg")),
        //    )

        ;
  }
}
