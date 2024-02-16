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
  late bool isFavoriteBook = false; // Initialize with a default value
  @override
  void initState() {
    getFavoriteBookStatus();
    super.initState();
  }

  Future<void> getFavoriteBookStatus() async {
    bool value = await context
        .read<FavoriteBooksCubit>()
        .isFavoriteBook(widget.book.bookId);
    setState(() {
      isFavoriteBook = value;
    });
  }

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
              if (isFavoriteBook) {
                context
                    .read<FavoriteBooksCubit>()
                    .unSaveFavoriteBooks(widget.book.bookId);
                setState(() {
                  isFavoriteBook = !isFavoriteBook;
                });
              } else {
                context.read<FavoriteBooksCubit>().saveFavoriteBooks(
                    widget.book.bookId,
                    widget.book.image,
                    widget.book.title,
                    widget.book.autherName,
                    widget.book.price,
                    widget.book.rating);
                setState(() {
                  isFavoriteBook = !isFavoriteBook;
                });
              }
            },
            icon: isFavoriteBook
                ? const Icon(Icons.favorite)
                : const Icon(Icons.favorite_border_outlined)),
      ],
    );
  }
}
