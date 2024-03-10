import 'package:clean_arch_bookly_app/core/widgets/error/error_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/widgets/snackbar/snackbar.dart';
import '../../../../../home/domain/entity/book_entity.dart';
import '../../manger/fetch_category_books/fetch_category_books_cubit.dart';
import 'grid_view_category.dart';

class CategoriesViewBody extends StatefulWidget {
  const CategoriesViewBody({super.key});

  @override
  State<CategoriesViewBody> createState() => _CategoriesViewBodyState();
}

class _CategoriesViewBodyState extends State<CategoriesViewBody> {
  late List<BookEntity> books;
  @override
  void initState() {
    context.read<FetchCategoryBooksCubit>().fetchCategoryBooks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<BookEntity> books = [];

    return BlocConsumer<FetchCategoryBooksCubit, FetchCategoryBooksState>(
      listener: (context, state) {
        if (state is FetchCategoryBooksSuccess) {
          books.addAll(state.books);
        }

        if (state is FetchCategoryBooksFailure) {
          // TODO
          //      ScaffoldMessenger.of(context).showSnackBar(
          //        buildErrorWidget(state.errMessage),
          //      );
        }
      },
      builder: (context, state) {
        if (state is FetchCategoryBooksFailure) {
          return ErrorText(title: state.errMessage);
        } else if (state is FetchCategoryBooksSuccess ||
            state is FetchCategoryBooksPaginationLoading ||
            state is FetchCategoryBooksFailure) {
          return GridViewCategory(books: books);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
