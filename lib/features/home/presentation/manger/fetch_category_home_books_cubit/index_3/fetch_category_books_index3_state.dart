part of 'fetch_category_books_index3_cubit.dart';

@immutable
class FetchCategoryBooksIndex3State {}

class FetchCategoryBooksIndex3Initial extends FetchCategoryBooksIndex3State {}

class FetchCategoryBooksIndex3Loading extends FetchCategoryBooksIndex3State {}

class FetchCategoryBooksIndex3Failure extends FetchCategoryBooksIndex3State {
  final String errMessage;

  FetchCategoryBooksIndex3Failure({required this.errMessage});
}

class FetchCategoryBooksIndex3Success extends FetchCategoryBooksIndex3State {
  final List<BookEntity> books;

  FetchCategoryBooksIndex3Success({required this.books});
}
