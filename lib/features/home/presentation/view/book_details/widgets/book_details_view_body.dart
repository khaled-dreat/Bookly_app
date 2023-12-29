import 'package:clean_arch_bookly_app/features/home/domain/entity/book_entity.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/view/book_details/widgets/custom_appbar_book_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/theme/app_theme.dart';
import '../../../manger/featured_book_details_cubit/book_details_cubit.dart';
import '../../home/widgets/book_rating.dart';
import '../../home/widgets/costom_book_image.dart';
import 'books_action.dart';
import 'books_details_list_view.dart';

class BookDetailsViewBody extends StatefulWidget {
  const BookDetailsViewBody({super.key});

  @override
  State<BookDetailsViewBody> createState() => _BookDetailsViewBodyState();
}

class _BookDetailsViewBodyState extends State<BookDetailsViewBody> {
  @override
// void initState() {
//   Future.delayed(Duration.zero, () async {
//     await BlocProvider.of<BookDetailsCubit>(context)
//         .fetchFeaturedBooksDeailsUseCase("BCvXDwAAQBAJ");
//   });
//
//   super.initState();
// }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookDetailsCubit, BookDetailsState>(
      builder: (context, state) {
        if (state is BookDetailsSuccess) {
          return BookDetails(
            book: state.book,
          );
        } else if (state is BookDetailsFailure) {
          Text(state.errMessage);
        }
        return const CircularProgressIndicator();
      },
    );
  }
}

class BookDetails extends StatelessWidget {
  const BookDetails({
    super.key,
    required this.book,
  });
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 28.r),
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
            reating: book.rating ?? "No Reating",
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
          const BooksDetailsListView()
        ],
      ),
    );
  }
}
