import '../../../../domain/entity/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/widgets/snackbar/snackbar.dart';
import '../../../manger/fetch_category_home_books_cubit/index_1/fetch_category_books_index1_cubit.dart';
import '../../../manger/fetch_category_home_books_cubit/index_2/fetch_category_books_index2_cubit.dart';
import '../../../manger/fetch_category_home_books_cubit/index_3/fetch_category_books_index3_cubit.dart';
import 'coustom_list_view.dart';

class FeaturedBooksListViewBlocIndex1 extends StatefulWidget {
  const FeaturedBooksListViewBlocIndex1(
      {super.key,
      required this.listCategoryIndex,
      required this.categoryTitle});

  final int listCategoryIndex;
  final String categoryTitle;

  @override
  State<FeaturedBooksListViewBlocIndex1> createState() =>
      _FeaturedBooksListViewBlocIndex1State();
}

class _FeaturedBooksListViewBlocIndex1State
    extends State<FeaturedBooksListViewBlocIndex1> {
  @override
  void initState() {
    super.initState();
    context.read<FetchCategoryBooksIndex1Cubit>().fetchCategoryBooksIndex1(
        categoryTitle: widget.categoryTitle,
        listCategoryIndex: widget.listCategoryIndex);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchCategoryBooksIndex1Cubit,
        FetchCategoryBooksIndex1State>(
      builder: (context, state) {
        if (state is FetchCategoryBooksIndex1Success) {
          // * List View Books
          return CoustomListView(
            books: state.books,
          );
        } else if (state is FetchCategoryBooksIndex1Failure) {
          return Text(state.errMessage);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}

class FeaturedBooksListViewBlocIndex2 extends StatefulWidget {
  const FeaturedBooksListViewBlocIndex2(
      {super.key,
      required this.listCategoryIndex,
      required this.categoryTitle});

  final int listCategoryIndex;
  final String categoryTitle;

  @override
  State<FeaturedBooksListViewBlocIndex2> createState() =>
      _FeaturedBooksListViewBlocIndex2State();
}

class _FeaturedBooksListViewBlocIndex2State
    extends State<FeaturedBooksListViewBlocIndex2> {
  @override
  void initState() {
    super.initState();
    context.read<FetchCategoryBooksIndex2Cubit>().fetchCategoryBooksIndex2(
        categoryTitle: widget.categoryTitle,
        listCategoryIndex: widget.listCategoryIndex);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchCategoryBooksIndex2Cubit,
        FetchCategoryBooksIndex2State>(
      builder: (context, state) {
        if (state is FetchCategoryBooksIndex2Success) {
          // * List View Books
          return CoustomListView(
            books: state.books,
          );
        } else if (state is FetchCategoryBooksIndex2Failure) {
          return Text(state.errMessage);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}

class FeaturedBooksListViewBlocIndex3 extends StatefulWidget {
  const FeaturedBooksListViewBlocIndex3(
      {super.key,
      required this.listCategoryIndex,
      required this.categoryTitle});

  final int listCategoryIndex;
  final String categoryTitle;

  @override
  State<FeaturedBooksListViewBlocIndex3> createState() =>
      _FeaturedBooksListViewBlocIndex3State();
}

class _FeaturedBooksListViewBlocIndex3State
    extends State<FeaturedBooksListViewBlocIndex3> {
  @override
  void initState() {
    super.initState();
    context.read<FetchCategoryBooksIndex3Cubit>().fetchCategoryBooksIndex3(
        categoryTitle: widget.categoryTitle,
        listCategoryIndex: widget.listCategoryIndex);
  }

  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchCategoryBooksIndex3Cubit,
        FetchCategoryBooksIndex3State>(
      builder: (context, state) {
        if (state is FetchCategoryBooksIndex3Success) {
          // * List View Books
          return CoustomListView(
            books: state.books,
          );
        } else if (state is FetchCategoryBooksIndex3Failure) {
          return Text(state.errMessage);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
