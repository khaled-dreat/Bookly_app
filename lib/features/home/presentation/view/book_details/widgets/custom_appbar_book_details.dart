import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../../../core/utils/local_data/app_local_data_key.dart';
import '../../../../../favorite/presentation/manger/favorite_books/favorite_books_cubit.dart';
import '../../../../domain/entity/book_entity.dart';

class CustomAppBarBookDetails extends StatefulWidget {
  const CustomAppBarBookDetails({super.key, required this.book});
  final BookEntity book;

  @override
  State<CustomAppBarBookDetails> createState() =>
      _CustomAppBarBookDetailsState();
}

class _CustomAppBarBookDetailsState extends State<CustomAppBarBookDetails> {
  /// late bool isFavoriteBook;
  /// @override
  /// void initState() {
  ///   x();
  ///   super.initState();
  /// }
  ///
  /// void x() async {
  ///   FavoriteBooksCubit bFavoriteBooks = context.read<FavoriteBooksCubit>();
  ///
  ///   isFavoriteBook = await bFavoriteBooks.isFavoriteBook(widget.book.bookId);
  /// }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close)),
        IconButton(
            onPressed: () {
              context.read<FavoriteBooksCubit>().saveFavoriteBooks(
                  widget.book.bookId,
                  widget.book.image,
                  widget.book.title,
                  widget.book.autherName,
                  widget.book.price,
                  widget.book.rating);
            },
            icon: // isFavoriteBook
                //    ? const Icon(Icons.favorite_border)
                const Icon(Icons.favorite_border)),
      ],
    );
  }
}
