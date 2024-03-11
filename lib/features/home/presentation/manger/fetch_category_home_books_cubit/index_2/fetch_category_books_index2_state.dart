part of 'fetch_category_books_index2_cubit.dart';

@immutable
class FetchCategoryBooksIndex2State {}

class FetchCategoryBooksIndex2Initial extends FetchCategoryBooksIndex2State {}

class FetchCategoryBooksIndex2Loading extends FetchCategoryBooksIndex2State {}

class FetchCategoryBooksIndex2Failure extends FetchCategoryBooksIndex2State {
  final String errMessage;

  FetchCategoryBooksIndex2Failure({required this.errMessage});
}

class FetchCategoryBooksIndex2Success extends FetchCategoryBooksIndex2State {
  final List<BookEntity> books;

  FetchCategoryBooksIndex2Success({required this.books});
}
