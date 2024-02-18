import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../../../../core/widgets/custom_img_books/costom_book_image.dart';
import '../../../../../home/domain/entity/book_entity.dart';
import '../../manger/fetch_category_books/fetch_category_books_cubit.dart';

class GridViewCategory extends StatefulWidget {
  const GridViewCategory({
    super.key,
    required this.books,
  });

  final List<BookEntity> books;

  @override
  State<GridViewCategory> createState() => _GridViewCategoryState();
}

class _GridViewCategoryState extends State<GridViewCategory> {
  late final ScrollController _scrollController;
  var nextPage = 1;
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() async {
    var currentPositions = _scrollController.position.pixels;
    var maxScrollLength = _scrollController.position.maxScrollExtent;
    if (currentPositions >= 0.7 * maxScrollLength) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<FetchCategoryBooksCubit>(context)
            .fetchCategoryBooks(pageNumber: nextPage++);
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int columnCount = 2;
    return AnimationLimiter(
      child: GridView.count(
        controller: _scrollController,
        childAspectRatio: .7,
        mainAxisSpacing: 15,
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        padding: EdgeInsets.all(15.r),
        crossAxisCount: columnCount,
        children: widget.books.map((book) {
          return AnimationConfiguration.staggeredGrid(
            position: widget.books.indexOf(book),
            duration: const Duration(milliseconds: 500),
            columnCount: columnCount,
            child: ScaleAnimation(
              duration: const Duration(milliseconds: 900),
              curve: Curves.fastLinearToSlowEaseIn,
              child: FadeInAnimation(
                child: SizedBox(
                  height: 350,
                  child: CostomBookImage(
                    image: book.image,
                    height: 300,
                    width: 200,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}