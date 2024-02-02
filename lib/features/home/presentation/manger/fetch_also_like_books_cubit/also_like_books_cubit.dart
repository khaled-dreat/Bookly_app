import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entity/book_entity.dart';
import '../../../domain/use_cases/fetch_also_like_book_use_case.dart';

part 'also_like_books_state.dart';

class AlsoLikeBooksCubit extends Cubit<AlsoLikeBooksState> {
  AlsoLikeBooksCubit(this.fetchAlsoLikeBooksUseCase)
      : super(AlsoLikeBooksInitial());
  final FetchAlsoLikeBooksUseCase fetchAlsoLikeBooksUseCase;
  Future<void> fetchAlsoLike({required String author}) async {
    emit(AlsoLikeBooksLoading());
    var result = await fetchAlsoLikeBooksUseCase.call(author);
    result.fold((failure) {
      emit(AlsoLikeBooksFailure(errMessage: failure.message));
    }, (books) {
      emit(AlsoLikeBooksSuccess(books: books));
    });
  }
}
