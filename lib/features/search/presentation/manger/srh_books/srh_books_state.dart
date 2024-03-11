part of 'srh_books_cubit.dart';

@immutable
class SrhBooksState {}

class SrhBooksInitial extends SrhBooksState {}

class SrhBooksLoading extends SrhBooksState {}

class SrhBooksshowSrhView extends SrhBooksState {}

class SrhBooksPaginationLoading extends SrhBooksState {}

class SrhBooksFailure extends SrhBooksState {
  final String errorMessage;

  SrhBooksFailure({required this.errorMessage});
}

class SrhBooksPaginationFailure extends SrhBooksState {
  final String errorMessage;

  SrhBooksPaginationFailure({required this.errorMessage});
}

class SrhBooksSuccess extends SrhBooksState {
  final List<SrhBookEntity> books;

  SrhBooksSuccess({required this.books});
}
