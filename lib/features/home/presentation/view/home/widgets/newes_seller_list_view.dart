import 'package:clean_arch_bookly_app/features/home/presentation/view/home/widgets/newest_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../domain/entity/book_entity.dart';

class NewestSellerListView extends StatelessWidget {
  const NewestSellerListView({super.key, required this.books});
  final List<BookEntity> books;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 8.r),
          child: NewestListViewItem(
            width: 170,
            books: books.elementAt(index),
          ),
        );
      },
    );
  }
}
