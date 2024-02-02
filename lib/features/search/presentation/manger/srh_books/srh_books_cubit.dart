import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:clean_arch_bookly_app/features/search/domain/use_cases/featured_srh_books_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../../core/utils/constant/app_failure.dart';
import '../../../domain/entity/srh_book_entity.dart';

part 'srh_books_state.dart';

class SrhBooksCubit extends Cubit<SrhBooksState> {
  SrhBooksCubit(this.featuredSrhBooksUseCase) : super(SrhBooksInitial());
  final FeaturedSrhBooksUseCase featuredSrhBooksUseCase;

  String? srhKey = "";
  void changeResult(String value) {
    srhKey = value;
  }

  List<String> categoryChoices = [];
  void changeCategoryChoices(List<String> value) {
    categoryChoices = value;
  }

  String searchByChoices = "";
  void changeSearchByChoices(String value) {
    searchByChoices = value;
  }

  List<SrhBookEntity> booksList = [];

  Future<void> fetchFeaturedSrhBooks({int pageNumber = 0}) async {
    if (srhKey != "") {
      if (pageNumber == 0) {
        emit(SrhBooksLoading());
      } else {
        emit(SrhBooksPaginationLoading());
      }
      Either<Failure, List<SrhBookEntity>> result =
          await featuredSrhBooksUseCase.call(pageNumber, srhKey);
      result.fold((failure) {
        if (pageNumber == 0) {
          emit(SrhBooksFailure(errorMessage: failure.message));
        } else {
          emit(SrhBooksPaginationFailure(errorMessage: failure.message));
        }
      }, (books) {
        emit(SrhBooksSuccess(books: books));
      });
    }
  }
}
