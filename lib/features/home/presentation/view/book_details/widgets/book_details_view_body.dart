import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/language/app_lang_key.dart';
import '../../../../../../core/utils/theme/app_theme.dart';
import '../../../../../../core/widgets/images/costom_book_image.dart';
import '../../../../domain/entity/book_entity.dart';
import '../../home/widgets/book_rating.dart';
import 'books_action.dart';
import 'books_details_list_view.dart';
import 'custom_appbar_book_details.dart';

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
            CustomAppBarBookDetails(book: book),
            // * Space
            20.verticalSpace,
            // * Image
            CostomBookImage(image: book.image, height: 230, width: 200),
            // * Space
            30.verticalSpace,
            // * Title
            Text(
              "${book.title}",
              textAlign: TextAlign.center,
              style: AppTheme.h4(context),
            ),
            10.verticalSpace,
            // * Name of Auther
            Opacity(
              opacity: 0.5,
              child: Text(
                book.autherName,
                style: AppTheme.h6(context),
              ),
            ),
            // *   BookRating
            DetailsBookRating(
              mainAxisAlignment: MainAxisAlignment.center,
              reating: book.rating,
            ),
            // *    Space
            30.verticalSpace,
            // * Bottun
            BooksAction(book: book),
            // * Space
            25.verticalSpace,
            // * Text Also Like
            Align(
                alignment: Alignment.centerLeft,
                child: Text(AppLangKey.youCanAlsoLike.tr())),
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
