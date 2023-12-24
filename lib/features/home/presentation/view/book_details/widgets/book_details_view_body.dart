import 'package:clean_arch_bookly_app/features/home/presentation/view/book_details/widgets/custom_appbar_book_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/constant/app_images.dart';
import '../../../../../../core/utils/theme/app_theme.dart';
import '../../home/widgets/costom_book_image.dart';
import '../../home/widgets/book_rating.dart';
import 'books_action.dart';
import 'books_details_list_view.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

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
          const CostomBookImage(
              image: AppImages.book1, height: 230, width: 200),
          // * Space
          30.verticalSpace,
          // * Title
          Text(
            "The Jungle Book",
            style: AppTheme.h4(context),
          ),
          // * Name of Writer
          Opacity(
            opacity: 0.5,
            child: Text(
              "Rudyard Kipting",
              style: AppTheme.h6(context),
            ),
          ),
          // * BookRating
          //    const BookRating(
          //      mainAxisAlignment: MainAxisAlignment.center,
          //    ),
          // * Space
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
