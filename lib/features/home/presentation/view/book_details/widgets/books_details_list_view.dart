import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/constant/app_images.dart';
import '../../home/widgets/costom_book_image.dart';

class BooksDetailsListView extends StatelessWidget {
  const BooksDetailsListView({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> books = [
      AppImages.book1,
      AppImages.book2,
      AppImages.book3,
      AppImages.book4,
    ];
    return SizedBox(
      height: 140.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: books.length,
        itemBuilder: (BuildContext context, int index) {
          // * Book Card
          return CostomBookImage(
            image: books.elementAt(index),
            height: 130,
            width: 120,
          );
        },
      ),
    );
  }
}
