import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../../../../core/widgets/custom_img_books/costom_book_image.dart';
import '../../../../../core/widgets/snackbar/snackbar.dart';
import '../../../../home/domain/entity/book_entity.dart';
import '../manger/index_1/fetch_category_books_index1_cubit.dart';

class CategoriesView extends StatelessWidget {
  static const String nameRoute = "CategoriesView";
  const CategoriesView({super.key, this.title});
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("$title Books")),
      body: const Gr(),
    );
  }
}

class Gr extends StatefulWidget {
  const Gr({super.key});

  @override
  State<Gr> createState() => _GrState();
}

class _GrState extends State<Gr> {
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
          ScaffoldMessenger.of(context).showSnackBar(
            buildErrorWidget(state.errMessage),
          );
        }
      },
      builder: (context, state) {
        if (state is FetchCategoryBooksSuccess ||
            state is FetchCategoryBooksPaginationLoading ||
            state is FetchCategoryBooksFailure) {
          return GridViewCategory(books: books);
        } else if (state is FetchCategoryBooksFailure) {
          return Text(state.errMessage);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}

class GridViewCategory extends StatefulWidget {
  const GridViewCategory({
    super.key,
    required this.books,
  });

  final List<BookEntity> books;

  @override
  State<GridViewCategory> createState() => _GridViewCategoryState();
}

class _GridViewCategoryState extends State<GridViewCategory> {
  late final ScrollController _scrollController;
  var nextPage = 1;
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() async {
    var currentPositions = _scrollController.position.pixels;
    var maxScrollLength = _scrollController.position.maxScrollExtent;
    if (currentPositions >= 0.7 * maxScrollLength) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<FetchCategoryBooksCubit>(context)
            .fetchCategoryBooks(pageNumber: nextPage++);
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int columnCount = 2;
    return AnimationLimiter(
      child: GridView.count(
        controller: _scrollController,
        childAspectRatio: .7,
        mainAxisSpacing: 15,
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        padding: EdgeInsets.all(15.r),
        crossAxisCount: columnCount,
        children: widget.books.map((book) {
          return AnimationConfiguration.staggeredGrid(
            position: widget.books.indexOf(book),
            duration: const Duration(milliseconds: 500),
            columnCount: columnCount,
            child: ScaleAnimation(
              duration: const Duration(milliseconds: 900),
              curve: Curves.fastLinearToSlowEaseIn,
              child: FadeInAnimation(
                child: SizedBox(
                  height: 350,
                  child: CostomBookImage(
                    image: book.image,
                    height: 300,
                    width: 200,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
