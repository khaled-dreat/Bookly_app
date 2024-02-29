import 'dart:developer';
import 'package:clean_arch_bookly_app/features/favorite/domain/entity/favorite_book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../../core/utils/routes/app_routes.dart';
import '../../../../core/widgets/custom_book_card/custom_book_card.dart';
import '../../../../core/widgets/images/costom_book_image.dart';
import '../../../home/domain/entity/book_entity.dart';
import '../../../home/presentation/manger/fetch_also_like_books_cubit/also_like_books_cubit.dart';
import '../../../home/presentation/manger/fetch_featured_book_details_cubit/fetch_book_details_cubit.dart';
import '../../../home/presentation/view/book_details/book_details_view.dart';
import '../manger/favorite_books/favorite_books_cubit.dart';

class FavoriteView extends StatelessWidget {
  static const String nameRoute = "FavoriteView";
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Favorite")),
      body: const FavoritViewBody(),
    );
  }
}

class FavoritViewBody extends StatefulWidget {
  const FavoritViewBody({super.key});

  @override
  State<FavoritViewBody> createState() => _FavoritViewBodyState();
}

class _FavoritViewBodyState extends State<FavoritViewBody> {
  @override
  void initState() {
    context.read<FavoriteBooksCubit>().fetchFavoriteBooks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBooksCubit, FavoriteBooksState>(
      builder: (context, state) {
        if (state is FavoriteBooksSuccess) {
          return GridViewFavoriteBooks(
            books: state.books,
          );
        } else if (state is FavoriteBooksFailure) {
          Text(state.errMessage);
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

class GridViewFavoriteBooks extends StatelessWidget {
  const GridViewFavoriteBooks({
    super.key,
    required this.books,
  });
  final List<FavoriteBookEntity> books;
  @override
  Widget build(BuildContext context) {
    int columnCount = 2;
    return AnimationLimiter(
      child: GridView.count(
        childAspectRatio: .7,
        mainAxisSpacing: 15,
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        padding: EdgeInsets.all(15.r),
        crossAxisCount: columnCount,
        children: books.asMap().entries.map((entry) {
          final index = entry.key;
          final book = entry.value;
          return AnimationConfiguration.staggeredGrid(
            position: index,
            duration: const Duration(milliseconds: 500),
            columnCount: columnCount,
            child: ScaleAnimation(
              duration: const Duration(milliseconds: 900),
              curve: Curves.fastLinearToSlowEaseIn,
              child: FadeInAnimation(
                child: SizedBox(
                    height: 350,
                    child: CoustomFavoriteBookCard(
                      books: book,
                      onTap: () async {
                        await BlocProvider.of<BookDetailsCubit>(context)
                            .fetchFeaturedBooksDetails(id: book.bookId);
                        await BlocProvider.of<AlsoLikeBooksCubit>(context)
                            .fetchAlsoLike(author: book.autherName);
                        AppRoutes.go(context, BookDetailsView.nameRoute);
                      },
                    )),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
