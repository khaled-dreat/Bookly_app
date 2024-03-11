part of 'also_like_books_cubit.dart';

@immutable
class AlsoLikeBooksState {}

class AlsoLikeBooksInitial extends AlsoLikeBooksState {}

class AlsoLikeBooksLoading extends AlsoLikeBooksState {}

class AlsoLikeBooksFailure extends AlsoLikeBooksState {
  final String errMessage;

  AlsoLikeBooksFailure({required this.errMessage});
}

class AlsoLikeBooksSuccess extends AlsoLikeBooksState {
  final List<BookEntity> books;

  AlsoLikeBooksSuccess({required this.books});
}
