import '../../../../domain/entity/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/widgets/custom_img_books/costom_book_image.dart';

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
      height: 170.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.books.length,
        itemBuilder: (BuildContext context, int index) {
          return // * Book Image
              widget.books.elementAt(index).image.isNotEmpty
                  ? CostomBookImage(
                      image: widget.books.elementAt(index).image,
                      height: 170,
                      width: 140,
                    )
                  : null;
        },
      ),
    );
  }
}
