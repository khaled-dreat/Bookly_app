import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../../../core/widgets/custom_book_card/custom_book_card.dart';
import '../../../../home/presentation/manger/fetch_also_like_books_cubit/also_like_books_cubit.dart';
import '../../../../home/presentation/manger/fetch_featured_book_details_cubit/fetch_book_details_cubit.dart';
import '../../../../home/presentation/view/book_details/book_details_view.dart';
import '../../../domain/entity/favorite_book_entity.dart';
import '../../manger/favorite_books/favorite_books_cubit.dart';

class AnimationConfigurationWidget extends StatelessWidget {
  const AnimationConfigurationWidget({
    super.key,
    required this.index,
    required this.columnCount,
    required this.book,
  });

  final int index;
  final int columnCount;
  final FavoriteBookEntity book;

  @override
  Widget build(BuildContext context) {
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
                  Navigator.pushNamed(context, BookDetailsView.nameRoute).then(
                      (value) => context
                          .read<FavoriteBooksCubit>()
                          .fetchFavoriteBooks());
                },
              )),
        ),
      ),
    );
  }
}
