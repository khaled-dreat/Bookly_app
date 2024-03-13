import 'package:clean_arch_bookly_app/core/widgets/error/error_text.dart';
import 'book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../manger/fetch_featured_book_details_cubit/fetch_book_details_cubit.dart';
import 'book_details_shimmer.dart';

class BookDetailsBlocBuilder extends StatelessWidget {
  const BookDetailsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookDetailsCubit, BookDetailsState>(
      builder: (context, state) {
        if (state is BookDetailsLoading) {
          return const BookDetailsShimmer();
        } else if (state is BookDetailsFailure) {
          return ErrorText(title: state.errMessage);
        } else if (state is BookDetailsSuccess) {
          return BookDetailsViewBody(
            book: state.book,
          );
        }
        return const BookDetailsShimmer();
      },
    );
  }
}
