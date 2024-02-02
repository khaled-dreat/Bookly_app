import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:clean_arch_bookly_app/features/home/domain/use_cases/fetch_book_details_use_case.dart';
import 'package:meta/meta.dart';

import '../../../domain/entity/book_entity.dart';

part 'fetch_book_details_state.dart';

class BookDetailsCubit extends Cubit<BookDetailsState> {
  BookDetailsCubit(this.fetchFeaturedBooksDeailsUseCase)
      : super(BookDetailsInitial());
  FetchBooksDeailsUseCase fetchFeaturedBooksDeailsUseCase;

  Future<void> fetchFeaturedBooksDetails({required String id}) async {
    log(name: "Book Details ID", id);
    emit(BookDetailsLoading());
    var result = await fetchFeaturedBooksDeailsUseCase.call(id);
    result.fold((failure) {
      emit(BookDetailsFailure(errMessage: failure.message));
      log(name: "Book Details Falure", failure.message);
    }, (book) {
      log(name: "Book Details", book.price.toString());
      emit(BookDetailsSuccess(book: book));
    });
  }
}
