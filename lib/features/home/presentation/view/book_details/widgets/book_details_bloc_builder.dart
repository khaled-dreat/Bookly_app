import '../../../../domain/entity/book_entity.dart';
import 'custom_appbar_book_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/theme/app_theme.dart';
import '../../../manger/fetch_featured_book_details_cubit/fetch_book_details_cubit.dart';
import '../../home/widgets/book_rating.dart';
import '../../../../../../core/widgets/custom_img_books/costom_book_image.dart';
import 'book_details_shimmer.dart';
import 'books_action.dart';
import 'books_details_list_view.dart';

class BookDetailsBlocBuilder extends StatelessWidget {
  const BookDetailsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookDetailsCubit, BookDetailsState>(
      builder: (context, state) {
        if (state is BookDetailsLoading) {
          return const BookDetailsShimmer();
        } else if (state is BookDetailsFailure) {
          Text(state.errMessage);
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

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({
    super.key,
    required this.book,
  });
  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.r),
        child: Column(
          children: [
            // * AppBar
            const CustomAppBarBookDetails(),
            // * Space
            20.verticalSpace,
            // * Image
            CostomBookImage(image: book.image, height: 230, width: 200),
            // * Space
            30.verticalSpace,
            // * Title
            Text(
              "${book.title}",
              style: AppTheme.h4(context),
            ),
            // * Name of Writer
            Opacity(
              opacity: 0.5,
              child: Text(
                book.autherName,
                style: AppTheme.h6(context),
              ),
            ),
            // *   BookRating
            BookRating(
              mainAxisAlignment: MainAxisAlignment.center,
              reating: book.rating,
            ),
            // *    Space
            30.verticalSpace,
            // * Bottun
            const BooksAction(),
            // * Space
            25.verticalSpace,
            // * Text Also Like
            const Align(
                alignment: Alignment.centerLeft,
                child: Text("You Can Also Like")),
            // * Space
            5.verticalSpace,
            // * Text Also Like List View
            const AlsoLikeBooksDetailsBlocBuilder()
          ],
        ),
      ),
    );
  }
}
