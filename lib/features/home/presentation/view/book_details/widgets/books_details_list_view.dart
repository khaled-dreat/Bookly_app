import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../manger/fetch_also_like_books_cubit/also_like_books_cubit.dart';
import '../../../../../../core/widgets/custom_img_books/costom_book_image.dart';

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
                  return CostomBookImage(
                    image: state.books.elementAt(index).image,
                    height: 130,
                    width: 120,
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
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
