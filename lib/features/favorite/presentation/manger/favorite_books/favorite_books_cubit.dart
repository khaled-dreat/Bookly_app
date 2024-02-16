import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import '../../../../../core/utils/local_data/app_local_data_key.dart';
import '../../../../home/domain/entity/book_entity.dart';
part 'favorite_books_state.dart';

class FavoriteBooksCubit extends Cubit<FavoriteBooksState> {
  List<BookEntity>? listfavoriteBooks;
  final Box<List<BookEntity>> haivFavoriteBooks;

  FavoriteBooksCubit()
      : haivFavoriteBooks =
            Hive.box<List<BookEntity>>(AppHiveKey.favoriteBooks),
        super(FavoriteBooksInitial());

  Future<void> fetchFavoriteBooks() async {
    emit(FavoriteBooksLoading());
    try {
      emit(FavoriteBooksSuccess(
          books: haivFavoriteBooks
              .get(AppHiveKey.keyFavoriteBooks)!
              .cast<BookEntity>()));
      log(haivFavoriteBooks
          .get(AppHiveKey.keyFavoriteBooks)!
          .length
          .toString());
    } catch (e) {
      emit(FavoriteBooksFailure(errMessage: e.toString()));
    }
  }

  Future<void> getFavoriteBooks() async {
    List<BookEntity>? favoriteBooks =
        haivFavoriteBooks.get(AppHiveKey.keyFavoriteBooks)?.cast<BookEntity>();
    listfavoriteBooks = favoriteBooks ?? [];
  }

  Future<bool> isFavoriteBook(String bookId) async {
    if (listfavoriteBooks != null) {
      return listfavoriteBooks!.any((e) => e.bookId == bookId);
    }
    return false;
  }

  void unSaveFavoriteBooks(String bookId) {
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
    BookEntity book = BookEntity(
      bookId: bookId,
      image: image,
      title: title,
      autherName: autherName,
      price: price,
      rating: rating,
    );

    if (listfavoriteBooks != null) {
      listfavoriteBooks!.add(book);
      haivFavoriteBooks.put(AppHiveKey.keyFavoriteBooks, listfavoriteBooks!);
    } else {
      listfavoriteBooks = [book];
      haivFavoriteBooks.put(AppHiveKey.keyFavoriteBooks, [book]);
    }
  }
}
