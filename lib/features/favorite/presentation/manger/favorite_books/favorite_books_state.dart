part of 'favorite_books_cubit.dart';

@immutable
class FavoriteBooksState {}

class FavoriteBooksInitial extends FavoriteBooksState {}

class FavoriteBooksLoading extends FavoriteBooksState {}

class FavoriteBooksFailure extends FavoriteBooksState {
  final String errMessage;

  FavoriteBooksFailure({required this.errMessage});
}

class FavoriteBooksSuccess extends FavoriteBooksState {
  final List<FavoriteBookEntity> books;

  FavoriteBooksSuccess({required this.books});
}
