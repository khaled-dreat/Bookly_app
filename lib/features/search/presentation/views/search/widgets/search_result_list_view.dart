import 'package:clean_arch_bookly_app/features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/view/home/widgets/newest_list_view_item.dart';
import 'package:clean_arch_bookly_app/features/search/domain/entity/srh_book_entity.dart';
import 'package:clean_arch_bookly_app/features/search/presentation/manger/srh_books/srh_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/routes/app_routes.dart';
import '../../../../../../core/utils/theme/app_theme.dart';
import '../../../../../home/presentation/view/book_details/book_details_view.dart';
import '../../../../../home/presentation/view/home/widgets/book_rating.dart';
import '../../../../../home/presentation/view/home/widgets/costom_book_image.dart';

class SearchResultListView extends StatefulWidget {
  const SearchResultListView({super.key, required this.books});
  final List<SrhBookEntity> books;

  @override
  State<SearchResultListView> createState() => _SearchResultListViewState();
}

class _SearchResultListViewState extends State<SearchResultListView> {
  late ScrollController scrollController;
  int nextPage = 1;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
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
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: widget.books.length,
      controller: scrollController,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
            padding: EdgeInsets.symmetric(vertical: 8.r),
            child: InkWell(
              onTap: () => AppRoutes.go(context, BookDetailsView.nameRoute),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            ));
      },
    );
  }
}
