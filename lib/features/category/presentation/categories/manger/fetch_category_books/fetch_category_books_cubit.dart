import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../home/domain/entity/book_entity.dart';
import '../../../../../home/domain/use_cases/fetch_featured_book_use_case.dart';

part 'etch_category_books_state.dart';

class FetchCategoryBooksCubit extends Cubit<FetchCategoryBooksState> {
  FetchCategoryBooksCubit(this.featuredBooksUseCase)
      : super(FetchCategoryBooksInitial());

  final FetchCategoryHomeBooksUseCase featuredBooksUseCase;
  int? listCategoryIndex;
  String? categoryTitle;
  void changeCategoryIndexAndTitle(int categoryIndex, String title) {
    categoryTitle = title;
    listCategoryIndex = categoryIndex;

    log(name: "changeCategoryIndexAndTitle", title);
  }

  Future<void> fetchCategoryBooks({
    int pageNumber = 1,
  }) async {
    if (pageNumber == 1) {
      emit(FetchCategoryBooksLoading());
    } else {
      emit(FetchCategoryBooksPaginationLoading());
    }

    log(listCategoryIndex.toString());

    var result = await featuredBooksUseCase.call(
        pageNumber, listCategoryIndex, categoryTitle);
    result.fold((failure) {
      if (pageNumber == 1) {
        emit(FetchCategoryBooksFailure(errMessage: failure.message));
      } else {
        emit(FetchCategoryBooksPaginationFailure(errMessage: failure.message));
      }
    }, (books) {
      emit(FetchCategoryBooksSuccess(books: books));
    });
  }
}
