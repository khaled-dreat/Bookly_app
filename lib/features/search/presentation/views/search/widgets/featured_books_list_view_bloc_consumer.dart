import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/widgets/snackbar/snackbar.dart';
import '../../../../domain/entity/srh_book_entity.dart';
import '../../../manger/srh_books/srh_books_cubit.dart';
import 'search_result_list_view.dart';

class FeaturedSrhBooksListViewBlocConsumer extends StatefulWidget {
  const FeaturedSrhBooksListViewBlocConsumer({
    super.key,
  });

  @override
  State<FeaturedSrhBooksListViewBlocConsumer> createState() =>
      _FeaturedSrhBooksListViewBlocConsumerState();
}

class _FeaturedSrhBooksListViewBlocConsumerState
    extends State<FeaturedSrhBooksListViewBlocConsumer> {
  List<SrhBookEntity> books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SrhBooksCubit, SrhBooksState>(
        listener: (context, state) {
      if (state is SrhBooksSuccess) {
        books.addAll(state.books);
      }
      if (state is SrhBooksPaginationFailure) {
        ScaffoldMessenger.of(context).showSnackBar(
          buildErrorWidget(state.errorMessage),
        );
      }
    }, builder: (context, state) {
      if (state is SrhBooksSuccess ||
          state is SrhBooksPaginationLoading ||
          state is SrhBooksPaginationFailure) {
        return SearchResultListView(
          books: books,
        );
      } else if (state is SrhBooksFailure) {
        return Text(state.errorMessage);
      }
      return const CircularProgressIndicator();
    });
  }
}
