import 'package:bloc/bloc.dart';
import 'package:clean_arch_bookly_app/features/home/domain/use_cases/fetch_featured_book_use_case.dart';
import 'package:meta/meta.dart';

import '../../../../domain/entity/book_entity.dart';

part 'fetch_category_books_index2_state.dart';

class FetchCategoryBooksIndex2Cubit
    extends Cubit<FetchCategoryBooksIndex2State> {
  FetchCategoryBooksIndex2Cubit(this.featuredBooksUseCase)
      : super(FetchCategoryBooksIndex2Initial());

  final FetchCategoryHomeBooksUseCase featuredBooksUseCase;
  Future<void> fetchCategoryBooksIndex2(
      {int pageNumber = 0,
      int? listCategoryIndex,
      String? categoryTitle}) async {
    emit(FetchCategoryBooksIndex2Loading());

    var result = await featuredBooksUseCase.call(
        pageNumber, listCategoryIndex, categoryTitle);
    result.fold((failure) {
      emit(FetchCategoryBooksIndex2Failure(errMessage: failure.message));
    }, (books) {
      emit(FetchCategoryBooksIndex2Success(books: books));
    });
  }
}
