import '../../../../domain/entity/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../manger/fetch_featured_books_cubit/fetch_featured_books_cubit.dart';
import '../../../../../../core/widgets/custom_img_books/costom_book_image.dart';

class CoustomListView extends StatefulWidget {
  const CoustomListView({super.key, required this.books});
  final List<BookEntity> books;

  @override
  State<CoustomListView> createState() => _CoustomListViewState();
}

class _CoustomListViewState extends State<CoustomListView> {
  late final ScrollController scrollController;
  int nextPage = 1;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(scrollListener);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void scrollListener() async {
    var currentPositions = scrollController.position.pixels;
    var maxScrollLength = scrollController.position.maxScrollExtent;
    if (currentPositions >= 0.7 * maxScrollLength) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<FeaturedBooksCubit>(context)
            .fetchFeaturedBooks(pageNumber: nextPage++);

        isLoading = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170.h,
      child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: widget.books.length,
        itemBuilder: (BuildContext context, int index) {
          // * Book Image
          return CostomBookImage(
            image: widget.books.elementAt(index).image,
            height: 170,
            width: 140,
          );
        },
      ),
    );
  }
}
