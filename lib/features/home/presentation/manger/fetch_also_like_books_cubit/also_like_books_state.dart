part of 'also_like_books_cubit.dart';

@immutable
sealed class AlsoLikeBooksState {}

final class AlsoLikeBooksInitial extends AlsoLikeBooksState {}

final class AlsoLikeBooksLoading extends AlsoLikeBooksState {}

final class AlsoLikeBooksFailure extends AlsoLikeBooksState {
  final String errMessage;

  AlsoLikeBooksFailure({required this.errMessage});
}

final class AlsoLikeBooksSuccess extends AlsoLikeBooksState {
  final List<BookEntity> books;

  AlsoLikeBooksSuccess({required this.books});
}
