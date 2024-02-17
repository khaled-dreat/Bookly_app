import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/routes/app_routes.dart';
import '../../../../../home/presentation/manger/fetch_also_like_books_cubit/also_like_books_cubit.dart';
import '../../../../../home/presentation/manger/fetch_featured_book_details_cubit/fetch_book_details_cubit.dart';
import '../../../../../home/presentation/view/book_details/book_details_view.dart';
import '../../../../domain/entity/srh_book_entity.dart';
import 'custom_srh_books_card.dart';

class CustomListviewSrhResult extends StatelessWidget {
  const CustomListviewSrhResult({
    super.key,
    required this.scrollController,
    required this.books,
  });

  final ScrollController scrollController;
  final List<SrhBookEntity> books;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: books.length,
      controller: scrollController,
      itemBuilder: (BuildContext context, int index) {
        SrhBookEntity book = books.elementAt(index);
        return book.image.isNotEmpty
            ? Padding(
                padding: EdgeInsets.symmetric(vertical: 8.r),
                child: InkWell(
                  onTap: () async {
                    await BlocProvider.of<BookDetailsCubit>(context)
                        .fetchFeaturedBooksDetails(id: book.bookId);
                    await BlocProvider.of<AlsoLikeBooksCubit>(context)
                        .fetchAlsoLike(author: book.autherName);
                    AppRoutes.go(context, BookDetailsView.nameRoute);
                    log(name: "Auther Name", book.bookId);
                  },
                  child: CustomSrhBooksCard(book: book),
                ))
            : null;
      },
    );
  }
}
