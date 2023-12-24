import 'package:bloc/bloc.dart';
import 'package:clean_arch_bookly_app/features/search/domain/use_cases/featured_srh_books_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../../core/utils/constant/app_failure.dart';
import '../../../domain/entity/srh_book_entity.dart';

part 'srh_books_state.dart';

class SrhBooksCubit extends Cubit<SrhBooksState> {
  SrhBooksCubit(this.featuredSrhBooksUseCase) : super(SrhBooksInitial());
  final FeaturedSrhBooksUseCase featuredSrhBooksUseCase;
  Future<void> fetchFeaturedSrhBooks() async {
    emit(SrhBooksLoading());
    Either<Failure, List<SrhBookEntity>> result =
        await featuredSrhBooksUseCase.call();
    result.fold((failure) {
      emit(SrhBooksFailure(errorMessage: failure.message));
    }, (books) {
      emit(SrhBooksSuccess(books: books));
    });
  }
}
