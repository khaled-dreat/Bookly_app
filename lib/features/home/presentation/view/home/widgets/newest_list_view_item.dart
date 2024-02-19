import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/widgets/images/costom_book_image.dart';

import '../../../../../../core/utils/routes/app_routes.dart';
import '../../../../../../core/utils/theme/app_theme.dart';
import '../../../../domain/entity/book_entity.dart';
import '../../book_details/book_details_view.dart';

import 'book_rating.dart';

class NewestListViewItem extends StatelessWidget {
  const NewestListViewItem({
    Key? key,
    required this.width,
    required this.books,
  }) : super(key: key);
  final double width;
  final BookEntity books;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => AppRoutes.go(context, BookDetailsView.nameRoute),
      child: Row(
        children: [
          CostomBookImage(image: books.image, height: 170, width: 140),
          10.horizontalSpace,
          SizedBox(
            width: width.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${books.title}",
                  style: AppTheme.h4(context),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  books.autherName,
                  style: AppTheme.h6(context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${books.price}\$",
                      style: AppTheme.s1(context),
                    ),
                    BookRating(
                      reating: books.rating,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
