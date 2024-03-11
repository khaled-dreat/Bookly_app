part of 'fetch_book_details_cubit.dart';

@immutable
class BookDetailsState {}

class BookDetailsInitial extends BookDetailsState {}

class BookDetailsLoading extends BookDetailsState {}

class BookDetailsFailure extends BookDetailsState {
  final String errMessage;

  BookDetailsFailure({required this.errMessage});
}

class BookDetailsSuccess extends BookDetailsState {
  final BookEntity book;

  BookDetailsSuccess({required this.book});
}
