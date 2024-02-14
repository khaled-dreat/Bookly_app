import 'package:clean_arch_bookly_app/core/utils/theme/app_theme.dart';

import '../../../../domain/entity/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/widgets/custom_img_books/costom_book_image.dart';
import 'book_rating.dart';

class CoustomListView extends StatefulWidget {
  const CoustomListView({super.key, required this.books});
  final List<BookEntity> books;

  @override
  State<CoustomListView> createState() => _CoustomListViewState();
}

class _CoustomListViewState extends State<CoustomListView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.books.length,
        itemBuilder: (BuildContext context, int index) {
          return widget.books.elementAt(index).image.isNotEmpty
              ? Container(
                  margin: EdgeInsets.only(right: 10),
                  child: SizedBox(
                    width: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CostomBookImage(
                          image: widget.books.elementAt(index).image,
                          height: 130,
                          width: 150,
                        ),
                        Text(
                          "${widget.books.elementAt(index).title}",
                          style: AppTheme.s1(context),
                          maxLines: 2,
                          overflow: TextOverflow.clip,
                        ),
                        Text("- ${widget.books.elementAt(index).autherName}",
                            style: AppTheme.s2(context)
                                ?.copyWith(color: Colors.white54)),
                        BookRating(
                            reating: widget.books.elementAt(index).rating)
                      ],
                    ),
                  ),
                )
              : null;
        },
      ),
    );
  }
}
