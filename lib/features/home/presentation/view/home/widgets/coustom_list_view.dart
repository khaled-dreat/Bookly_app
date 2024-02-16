import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/routes/app_routes.dart';
import '../../../../../../core/widgets/custom_book_card/custom_book_card.dart';
import '../../../../domain/entity/book_entity.dart';
import '../../../manger/fetch_also_like_books_cubit/also_like_books_cubit.dart';
import '../../../manger/fetch_featured_book_details_cubit/fetch_book_details_cubit.dart';
import '../../book_details/book_details_view.dart';

class CoustomListView extends StatefulWidget {
  const CoustomListView({super.key, required this.books});
  final List<BookEntity> books;

  @override
  State<CoustomListView> createState() => _CoustomListViewState();
}

class _CoustomListViewState extends State<CoustomListView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.books.length,
        itemBuilder: (BuildContext context, int index) {
          return CoustomBookCard(
            books: widget.books.elementAt(index),
            onTap: () async {
              await BlocProvider.of<BookDetailsCubit>(context)
                  .fetchFeaturedBooksDetails(
                      id: widget.books.elementAt(index).bookId);
              await BlocProvider.of<AlsoLikeBooksCubit>(context).fetchAlsoLike(
                  author: widget.books.elementAt(index).autherName);
              AppRoutes.go(context, BookDetailsView.nameRoute);
            },
          );
        },
      ),
    );
  }
}
