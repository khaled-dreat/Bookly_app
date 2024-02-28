import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/routes/app_routes.dart';
import '../../../manger/fetch_also_like_books_cubit/also_like_books_cubit.dart';
import '../../../../../../core/widgets/images/costom_book_image.dart';
import '../../../manger/fetch_featured_book_details_cubit/fetch_book_details_cubit.dart';
import '../book_details_view.dart';

class AlsoLikeBooksDetailsBlocBuilder extends StatelessWidget {
  const AlsoLikeBooksDetailsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlsoLikeBooksCubit, AlsoLikeBooksState>(
      builder: (context, state) {
        if (state is AlsoLikeBooksSuccess) {
          return SizedBox(
            height: 140.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (BuildContext context, int index) {
                log(
                    name: "books also like Image",
                    state.books.elementAt(index).image);
                // * Book Card

                if (state.books.elementAt(index).image.isNotEmpty) {
                  return InkWell(
                    onTap: () async {
                      await BlocProvider.of<BookDetailsCubit>(context)
                          .fetchFeaturedBooksDetails(
                              id: state.books.elementAt(index).bookId);
                      await BlocProvider.of<AlsoLikeBooksCubit>(context)
                          .fetchAlsoLike(
                              author: state.books.elementAt(index).autherName);
                      AppRoutes.go(context, BookDetailsView.nameRoute);
                    },
                    child: CostomBookImage(
                      image: state.books.elementAt(index).image,
                      height: 130,
                      width: 120,
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
          );
        } else if (state is AlsoLikeBooksFailure) {
          return Text(state.errMessage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
