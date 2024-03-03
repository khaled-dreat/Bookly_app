import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:clean_arch_bookly_app/core/usecase/use_case.dart';
import 'package:clean_arch_bookly_app/features/favorite/domain/entity/favorite_book_entity.dart';
import 'package:clean_arch_bookly_app/features/favorite/domain/use_cases/add_favorite_book_use_case.dart';
import 'package:clean_arch_bookly_app/features/favorite/domain/use_cases/fetch_favorite_book_use_case.dart';
import 'package:clean_arch_bookly_app/features/favorite/domain/use_cases/remove_favorite_book_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:dartz/dartz_unsafe.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import '../../../../../core/utils/constant/app_failure.dart';
import '../../../../../core/utils/local_data/app_local_data_key.dart';
part 'favorite_books_state.dart';

class FavoriteBooksCubit extends Cubit<FavoriteBooksState> {
  FavoriteBooksCubit(this.addFavoriteBooksUseCase,
      this.fetchFavoriteBooksUseCase, this.removeFavoriteBooksUseCase)
      : super(FavoriteBooksInitial());

  Box<FavoriteBookEntity> haivFavoriteBooks =
      Hive.box<FavoriteBookEntity>(AppHiveKey.favoriteBooks);
//  List<FavoriteBookEntity>? listfavoriteBooksDB;
  List<FavoriteBookEntity>? listfavoriteBooks;
  final AddFavoriteBooksUseCase addFavoriteBooksUseCase;
  final RemoveFavoriteBooksUseCase removeFavoriteBooksUseCase;
  final FetchFavoriteBooksUseCase fetchFavoriteBooksUseCase;

  Future<void> fetchFavoriteBooks() async {
    emit(FavoriteBooksLoading());
    getFavoriteBooks();
    try {
      log(listfavoriteBooks.toString());
      emit(FavoriteBooksSuccess(books: listfavoriteBooks!));
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
      for (var book in books) {
        addFavoriteBooks(book: book);
      }
    });
  }

  Future<void> getFavoriteBooks() async {
    List<FavoriteBookEntity> favoriteBooks = haivFavoriteBooks.values.toList();
    listfavoriteBooks = favoriteBooks;
  }

  Future<bool> isFavoriteBook(String bookId) async {
    if (listfavoriteBooks != null) {
      return listfavoriteBooks!.any((e) => e.bookId == bookId);
    }
    return false;
  }

  void unSaveFavoriteBooks(String bookId) {
    if (listfavoriteBooks != null) {
      final index =
          listfavoriteBooks!.indexWhere((book) => book.bookId == bookId);
      if (index != -1) {
        haivFavoriteBooks.deleteAt(index);
        unSaveFavoriteBooksDB(bookId);
      }
    }
  }

  void unSaveFavoriteBooksDB(String bookId) {
    removeFavoriteBooksUseCase.call(bookId);
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

  void addFavoriteBooks({required FavoriteBookEntity book}) async {
    Box<FavoriteBookEntity> haivADDFavoriteBooks =
        Hive.box<FavoriteBookEntity>(AppHiveKey.favoriteBooks);
    await haivADDFavoriteBooks.add(book);
  }
}/*
*/