import 'dart:developer';
import 'package:clean_arch_bookly_app/features/home/presentation/manger/fetch_also_like_books_cubit/also_like_books_cubit.dart';
import 'package:clean_arch_bookly_app/features/search/domain/entity/srh_book_entity.dart';
import 'package:clean_arch_bookly_app/features/search/presentation/manger/srh_books/srh_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/routes/app_routes.dart';
import '../../../../../../core/utils/theme/app_theme.dart';
import '../../../../../home/presentation/manger/fetch_featured_book_details_cubit/fetch_book_details_cubit.dart';
import '../../../../../home/presentation/view/book_details/book_details_view.dart';
import '../../../../../home/presentation/view/home/widgets/book_rating.dart';
import '../../../../../../core/widgets/custom_img_books/costom_book_image.dart';

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
  String searchKey = 'game';
  // اخذ القيمة من هاي
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
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: widget.books.length,
            controller: scrollController,
            itemBuilder: (BuildContext context, int index) {
              return widget.books[index].image.isNotEmpty
                  ? Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.r),
                      child: InkWell(
                        onTap: () async {
                          await BlocProvider.of<BookDetailsCubit>(context)
                              .fetchFeaturedBooksDetails(
                                  id: widget.books[index].bookId);
                          await BlocProvider.of<AlsoLikeBooksCubit>(context)
                              .fetchAlsoLike(
                                  author: widget.books[index].autherName);
                          AppRoutes.go(context, BookDetailsView.nameRoute);
                          log(
                              name: "Auther Name",
                              widget.books[index].autherName);
                        },
                        child: Row(
                          children: [
                            CostomBookImage(
                                image: widget.books[index].image,
                                height: 150,
                                width: 120),
                            10.horizontalSpace,
                            SizedBox(
                              width: 170.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${widget.books[index].title}",
                                    style: AppTheme.b1(context),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                  10.verticalSpace,
                                  Text(
                                    widget.books[index].autherName,
                                    style: AppTheme.s2(context),
                                  ),
                                  5.verticalSpace,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${widget.books[index].price}\$",
                                        style: AppTheme.s1(context),
                                      ),
                                      BookRating(
                                        reating:
                                            "${widget.books[index].rating ?? "No Reating"}",
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ))
                  : null;
            },
          ),
        ),
      ],
    );
  }
}
