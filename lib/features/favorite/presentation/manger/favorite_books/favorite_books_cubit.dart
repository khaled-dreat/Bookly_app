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
  List<BookFavoriteEntity>? listfavoriteBooks;

  FavoriteBooksCubit() : super(FavoriteBooksInitial());
  Box<List<BookFavoriteEntity>> haivFavoriteBooks =
      Hive.box<List<BookFavoriteEntity>>(AppHiveKey.favoriteBooks);
  Future<void> fetchFavoriteBooks() async {
    if (listfavoriteBooks != null) {
      emit(FavoriteBooksLoading());
      try {
        emit(FavoriteBooksSuccess(books: listfavoriteBooks!));
        log(haivFavoriteBooks
            .get(AppHiveKey.keyFavoriteBooks)!
            .length
            .toString());
      } catch (e) {
        emit(FavoriteBooksFailure(errMessage: e.toString()));
      }
    }
  }

  Future<void> getFavoriteBooks() async {
    List<BookFavoriteEntity>? favoriteBooks = haivFavoriteBooks
        .get(AppHiveKey.keyFavoriteBooks)
        ?.cast<BookFavoriteEntity>();
    listfavoriteBooks = favoriteBooks ?? [];
  }

  Future<bool> isFavoriteBook(String bookId) async {
    if (listfavoriteBooks != null) {
      return listfavoriteBooks!.any((e) => e.bookId == bookId);
    }
    return false;
  }

  void unSaveFavoriteBooks(
    String bookId,
  ) {
    if (listfavoriteBooks != null) {
      listfavoriteBooks!.removeWhere((e) => e.bookId == bookId);
      haivFavoriteBooks.put(AppHiveKey.keyFavoriteBooks, listfavoriteBooks!);
    }
  }

  void saveFavoriteBooks(
    String bookId,
    String image,
    String? title,
    String autherName,
    double? price,
    String rating,
  ) {
    BookFavoriteEntity book = BookFavoriteEntity(
        bookId: bookId,
        image: image,
        title: title,
        autherName: autherName,
        price: price,
        rating: rating);

    if (listfavoriteBooks != null) {
      listfavoriteBooks!.add(book);
      haivFavoriteBooks.put(AppHiveKey.keyFavoriteBooks, listfavoriteBooks!);
    } else {
      listfavoriteBooks = [book];
      haivFavoriteBooks.put(AppHiveKey.keyFavoriteBooks, [book]);
    }
  }
}
// drmiEAAAQBAJ
// drmiEAAAQBAJ
// drmiEAAAQBAJ
// drmiEAAAQBAJ