part of 'fetch_category_books_cubit.dart';

@immutable
sealed class FetchCategoryBooksState {}

final class FetchCategoryBooksInitial extends FetchCategoryBooksState {}

final class FetchCategoryBooksLoading extends FetchCategoryBooksState {}

final class FetchCategoryBooksPaginationLoading
    extends FetchCategoryBooksState {}

class FetchCategoryBooksFailure extends FetchCategoryBooksState {
  final String errMessage;

  FetchCategoryBooksFailure({required this.errMessage});
}

class FetchCategoryBooksPaginationFailure extends FetchCategoryBooksState {
  final String errMessage;

  FetchCategoryBooksPaginationFailure({required this.errMessage});
}

final class FetchCategoryBooksSuccess extends FetchCategoryBooksState {
  final List<BookEntity> books;

  FetchCategoryBooksSuccess({required this.books});
}
