import 'dart:developer';

import '../../../../domain/entity/book_entity.dart';
import '../../../../domain/use_cases/fetch_featured_book_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fetch_category_books_index1_state.dart';

class FetchCategoryBooksIndex1Cubit
    extends Cubit<FetchCategoryBooksIndex1State> {
  FetchCategoryBooksIndex1Cubit(this.featuredBooksUseCase)
      : super(FetchCategoryBooksIndex1Initial());

  final FetchCategoryHomeBooksUseCase featuredBooksUseCase;
  Future<void> fetchCategoryBooksIndex1(
      {int pageNumber = 0,
      int? listCategoryIndex,
      String? categoryTitle}) async {
    emit(FetchCategoryBooksIndex1Loading());

    var result = await featuredBooksUseCase.call(
        pageNumber, listCategoryIndex, categoryTitle);
    result.fold((failure) {
      emit(FetchCategoryBooksIndex1Failure(errMessage: failure.message));
    }, (books) {
      emit(FetchCategoryBooksIndex1Success(books: books));
    });
  }
}
