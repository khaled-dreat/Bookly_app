import 'dart:developer';

import 'package:clean_arch_bookly_app/core/utils/language/app_lang_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/theme/app_theme.dart';
import '../../../../../../core/widgets/images/costom_book_image.dart';
import '../../../../../home/presentation/view/home/widgets/book_rating.dart';
import '../../../../domain/entity/srh_book_entity.dart';

class CustomSrhBooksCard extends StatelessWidget {
  const CustomSrhBooksCard({
    super.key,
    required this.book,
  });

  final SrhBookEntity book;

  @override
  Widget build(BuildContext context) {
    double price = double.parse(((book.price ?? 10) * 0.1).toStringAsFixed(1));
    log(book.price.toString());
    return Row(
      children: [
        CostomBookImage(image: book.image, height: 150, width: 120),
        10.horizontalSpace,
        SizedBox(
          width: 170.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${book.title}",
                style: AppTheme.b1(context),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              10.verticalSpace,
              Text(
                book.autherName,
                style: AppTheme.s2(context),
              ),
              5.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "$price\$",
                    style: AppTheme.s1(context),
                  ),
                  BookRating(
                    reating: "${book.rating ?? AppLangKey.noReating}",
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
