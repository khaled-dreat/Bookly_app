part of 'favorite_books_cubit.dart';

@immutable
sealed class FavoriteBooksState {}

final class FavoriteBooksInitial extends FavoriteBooksState {}

final class FavoriteBooksLoading extends FavoriteBooksState {}

final class FavoriteBooksFailure extends FavoriteBooksState {
  final String errMessage;

  FavoriteBooksFailure({required this.errMessage});
}

final class FavoriteBooksSuccess extends FavoriteBooksState {
  final List<BookFavoriteEntity> books;

  FavoriteBooksSuccess({required this.books});
}
