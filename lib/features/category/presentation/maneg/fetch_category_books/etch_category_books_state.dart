part of 'fetch_category_books_cubit.dart';

@immutable
class FetchCategoryBooksState {}

class FetchCategoryBooksInitial extends FetchCategoryBooksState {}

class FetchCategoryBooksLoading extends FetchCategoryBooksState {}

class FetchCategoryBooksPaginationLoading extends FetchCategoryBooksState {}

class FetchCategoryBooksFailure extends FetchCategoryBooksState {
  final String errMessage;

  FetchCategoryBooksFailure({required this.errMessage});
}

class FetchCategoryBooksPaginationFailure extends FetchCategoryBooksState {
  final String errMessage;

  FetchCategoryBooksPaginationFailure({required this.errMessage});
}

class FetchCategoryBooksSuccess extends FetchCategoryBooksState {
  final List<BookEntity> books;

  FetchCategoryBooksSuccess({required this.books});
}
