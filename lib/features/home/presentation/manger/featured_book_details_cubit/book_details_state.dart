part of 'book_details_cubit.dart';

@immutable
sealed class BookDetailsState {}

final class BookDetailsInitial extends BookDetailsState {}

final class BookDetailsLoading extends BookDetailsState {}

final class BookDetailsFailure extends BookDetailsState {
  final String errMessage;

  BookDetailsFailure({required this.errMessage});
}

final class BookDetailsSuccess extends BookDetailsState {
  final BookEntity book;

  BookDetailsSuccess({required this.book});
}
