import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:clean_arch_bookly_app/features/home/data/models/book/book.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

import '../../../../../core/utils/local_data/app_local_data_key.dart';
import '../../../../../core/utils/local_data/save_books_local_data.dart';
import '../../../../home/domain/entity/book_entity.dart';
import '../../../domain/entity/book_entity.dart';

part 'favorite_books_state.dart';

class FavoriteBooksCubit extends Cubit<FavoriteBooksState> {
  FavoriteBooksCubit() : super(FavoriteBooksInitial());
  Box<List<BookFavoriteEntity>> haivFavoriteBooks =
      Hive.box<List<BookFavoriteEntity>>(AppHiveKey.favoriteBooks);
  Future<void> getFavoriteBooks() async {
    emit(FavoriteBooksLoading());
    try {
      emit(FavoriteBooksSuccess(
          books: haivFavoriteBooks.get(AppHiveKey.keyFavoriteBooks)!));
      log(haivFavoriteBooks
          .get(AppHiveKey.keyFavoriteBooks)!
          .length
          .toString());
    } catch (e) {
      emit(FavoriteBooksFailure(errMessage: e.toString()));
    }
  }

  // Future<bool> isFavoriteBook(String bookId) async {
  //   Box<BookFavoriteEntity> box =
  //       Hive.box<BookFavoriteEntity>(AppHiveKey.favoriteBooks);
  //   return box.containsKey(bookId);
  // }

  void saveFavoriteBooks(
    String bookId,
    String image,
    String? title,
    String autherName,
    double? price,
    String rating,
  ) {
    BookFavoriteEntity books = BookFavoriteEntity(
        bookId: bookId,
        image: image,
        title: title,
        autherName: autherName,
        price: price,
        rating: rating);

    log(books.title.toString());
    haivFavoriteBooks.put(AppHiveKey.keyFavoriteBooks, [books]);
  }
}
