import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/widgets/snackbar/snackbar.dart';
import '../../../manger/srh_books/srh_books_cubit.dart';
import 'list_view_shimmer_srh.dart';
import 'search_result_list_view.dart';
import 'waiting_widget.dart';

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
  @override
  Widget build(BuildContext context) {
    SrhBooksCubit bSrhBooks = BlocProvider.of<SrhBooksCubit>(context);
    return BlocConsumer<SrhBooksCubit, SrhBooksState>(
        listener: (context, state) {
      if (state is SrhBooksSuccess) {
        // * Pagination Success State
        bSrhBooks.booksList.addAll(state.books);
      }
      if (state is SrhBooksPaginationFailure) {
        // * Pagination Failure State
        ScaffoldMessenger.of(context).showSnackBar(
          buildErrorWidget(state.errorMessage),
        );
      }
    }, builder: (context, state) {
      if (state is SrhBooksSuccess ||
          state is SrhBooksPaginationLoading ||
          state is SrhBooksPaginationFailure) {
        // * Success State
        return SearchResultListView(
          books: bSrhBooks.booksList,
        );
      } else if (state is SrhBooksFailure) {
        // * Failure State
        return Text(state.errorMessage);
      } else if (state is SrhBooksshowSrhView) {
        // *  Waiting For Search State
        return const WaitingWidget();
      } else {
        // * Loading State
        return const ListViewShimmerSrh();
      }
    });
  }
}
