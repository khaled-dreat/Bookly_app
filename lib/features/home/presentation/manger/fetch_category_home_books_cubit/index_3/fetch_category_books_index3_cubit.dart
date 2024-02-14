import 'package:bloc/bloc.dart';
import 'package:clean_arch_bookly_app/features/home/domain/use_cases/fetch_featured_book_use_case.dart';
import 'package:meta/meta.dart';

import '../../../../domain/entity/book_entity.dart';

part 'fetch_category_books_index3_state.dart';

class FetchCategoryBooksIndex3Cubit
    extends Cubit<FetchCategoryBooksIndex3State> {
  FetchCategoryBooksIndex3Cubit(this.featuredBooksUseCase)
      : super(FetchCategoryBooksIndex3Initial());

  final FetchCategoryHomeBooksUseCase featuredBooksUseCase;
  Future<void> fetchCategoryBooksIndex3(
      {int pageNumber = 0,
      int? listCategoryIndex,
      String? categoryTitle}) async {
    emit(FetchCategoryBooksIndex3Loading());

    var result = await featuredBooksUseCase.call(
        pageNumber, listCategoryIndex, categoryTitle);
    result.fold((failure) {
      emit(FetchCategoryBooksIndex3Failure(errMessage: failure.message));
    }, (books) {
      emit(FetchCategoryBooksIndex3Success(books: books));
    });
  }
}
