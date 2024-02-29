import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:clean_arch_bookly_app/core/usecase/use_case.dart';
import 'package:clean_arch_bookly_app/features/favorite/domain/entity/favorite_book_entity.dart';
import 'package:clean_arch_bookly_app/features/favorite/domain/use_cases/add_favorite_book_use_case.dart';
import 'package:clean_arch_bookly_app/features/favorite/domain/use_cases/fetch_favorite_book_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import '../../../../../core/utils/constant/app_failure.dart';
import '../../../../../core/utils/local_data/app_local_data_key.dart';
part 'favorite_books_state.dart';

class FavoriteBooksCubit extends Cubit<FavoriteBooksState> {
  List<FavoriteBookEntity>? listfavoriteBooks;
  List<FavoriteBookEntity>? listfavoriteBooksDB;
  final Box<List<FavoriteBookEntity>> haivFavoriteBooks;
  final AddFavoriteBooksUseCase addFavoriteBooksUseCase;
  final FetchFavoriteBooksUseCase fetchFavoriteBooksUseCase;
  FavoriteBooksCubit(
      this.addFavoriteBooksUseCase, this.fetchFavoriteBooksUseCase)
      : haivFavoriteBooks =
            Hive.box<List<FavoriteBookEntity>>(AppHiveKey.favoriteBooks),
        super(FavoriteBooksInitial());

  Future<void> fetchFavoriteBooks() async {
    emit(FavoriteBooksLoading());
    try {
      emit(FavoriteBooksSuccess(
          books: haivFavoriteBooks
              .get(AppHiveKey.keyFavoriteBooks)!
              .cast<FavoriteBookEntity>()));
      log(haivFavoriteBooks
          .get(AppHiveKey.keyFavoriteBooks)!
          .length
          .toString());
    } catch (e) {
      emit(FavoriteBooksFailure(errMessage: e.toString()));
    }
  }

  Future<void> fetchFavoriteBooksDB() async {
    Either<Failure, List<FavoriteBookEntity>> result =
        await fetchFavoriteBooksUseCase.call();

    result.fold((failure) {
      log(failure.message);
    }, (books) {
      listfavoriteBooksDB = books;
    });
  }

  Future<void> getFavoriteBooks() async {
    List<FavoriteBookEntity>? favoriteBooks = haivFavoriteBooks
        .get(AppHiveKey.keyFavoriteBooks)
        ?.cast<FavoriteBookEntity>();
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
    // TODO : Repleas Parameter to FavoriteBookEntity book
    FavoriteBookEntity book = FavoriteBookEntity(
      bookId: bookId,
      image: image,
      title: title,
      autherName: autherName,
      price: price,
      rating: rating,
    );

    addFavoriteBooksUseCase.call(book);
    addFavoriteBooks(book: book);
  }

  void addFavoriteBooks({required FavoriteBookEntity book}) {
    if (listfavoriteBooks != null) {
      listfavoriteBooks!.add(book);
      haivFavoriteBooks.put(AppHiveKey.keyFavoriteBooks, listfavoriteBooks!);
    } else {
      listfavoriteBooks = [book];
      haivFavoriteBooks.put(AppHiveKey.keyFavoriteBooks, [book]);
    }
  }
}
