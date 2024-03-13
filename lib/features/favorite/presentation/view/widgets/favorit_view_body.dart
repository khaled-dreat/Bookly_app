import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manger/favorite_books/favorite_books_cubit.dart';
import 'gridview_favorite_books.dart';

class FavoritViewBody extends StatefulWidget {
  const FavoritViewBody({super.key});

  @override
  State<FavoritViewBody> createState() => _FavoritViewBodyState();
}

class _FavoritViewBodyState extends State<FavoritViewBody> {
  @override
  void initState() {
    context.read<FavoriteBooksCubit>().fetchFavoriteBooks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBooksCubit, FavoriteBooksState>(
      builder: (context, state) {
        if (state is FavoriteBooksSuccess) {
          return GridViewFavoriteBooks(
            books: state.books,
          );
        } else if (state is FavoriteBooksFailure) {
          log(state.errMessage);
          Text(state.errMessage);
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
