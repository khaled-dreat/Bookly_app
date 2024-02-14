part of 'fetch_category_books_index1_cubit.dart';

@immutable
sealed class FetchCategoryBooksIndex1State {}

final class FetchCategoryBooksIndex1Initial
    extends FetchCategoryBooksIndex1State {}

final class FetchCategoryBooksIndex1Loading
    extends FetchCategoryBooksIndex1State {}

class FetchCategoryBooksIndex1Failure extends FetchCategoryBooksIndex1State {
  final String errMessage;

  FetchCategoryBooksIndex1Failure({required this.errMessage});
}

final class FetchCategoryBooksIndex1Success
    extends FetchCategoryBooksIndex1State {
  final List<BookEntity> books;

  FetchCategoryBooksIndex1Success({required this.books});
}
