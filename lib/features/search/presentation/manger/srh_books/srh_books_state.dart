part of 'srh_books_cubit.dart';

@immutable
sealed class SrhBooksState {}

final class SrhBooksInitial extends SrhBooksState {}

final class SrhBooksLoading extends SrhBooksState {}

final class SrhBooksshowSrhView extends SrhBooksState {}

final class SrhBooksPaginationLoading extends SrhBooksState {}

final class SrhBooksFailure extends SrhBooksState {
  final String errorMessage;

  SrhBooksFailure({required this.errorMessage});
}

final class SrhBooksPaginationFailure extends SrhBooksState {
  final String errorMessage;

  SrhBooksPaginationFailure({required this.errorMessage});
}

final class SrhBooksSuccess extends SrhBooksState {
  final List<SrhBookEntity> books;

  SrhBooksSuccess({required this.books});
}

final class SrhBooksResult extends SrhBooksState {
  final String result;

  SrhBooksResult(this.result);

  String changeResult() {
    return result;
  }
}
