import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../domain/entity/favorite_book_entity.dart';
import 'animation_configuration.dart';

class GridViewFavoriteBooks extends StatelessWidget {
  const GridViewFavoriteBooks({
    super.key,
    required this.books,
  });
  final List<FavoriteBookEntity> books;
  @override
  Widget build(BuildContext context) {
    int columnCount = 2;
    return AnimationLimiter(
      child: GridView.count(
        childAspectRatio: .7,
        mainAxisSpacing: 15,
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        padding: EdgeInsets.all(15.r),
        crossAxisCount: columnCount,
        children: books.asMap().entries.map((entry) {
          final index = entry.key;
          final book = entry.value;
          return AnimationConfigurationWidget(
              index: index, columnCount: columnCount, book: book);
        }).toList(),
      ),
    );
  }
}
