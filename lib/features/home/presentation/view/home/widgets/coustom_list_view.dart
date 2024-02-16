import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/widgets/custom_book_card/custom_book_card.dart';
import '../../../../domain/entity/book_entity.dart';

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
          return CoustomBookCard(
            books: widget.books.elementAt(index),
          );
        },
      ),
    );
  }
}
