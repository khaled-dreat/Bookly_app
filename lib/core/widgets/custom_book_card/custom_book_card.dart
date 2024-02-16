import 'package:flutter/material.dart';

import '../../../features/home/domain/entity/book_entity.dart';
import '../../../features/home/presentation/view/home/widgets/book_rating.dart';
import '../../../features/home/presentation/view/home/widgets/coustom_list_view.dart';
import '../../utils/theme/app_theme.dart';
import '../custom_img_books/costom_book_image.dart';

class CoustomBookCard extends StatelessWidget {
  const CoustomBookCard({
    Key? key,
    required this.books,
    this.onTap,
  }) : super(key: key);

  final BookEntity books;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return books.image.isNotEmpty
        ? InkWell(
            onTap: onTap,
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              child: SizedBox(
                width: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CostomBookImage(
                      image: books.image,
                      height: 130,
                      width: 150,
                    ),
                    Text(
                      "${books.title}",
                      style: AppTheme.s1(context),
                      maxLines: 2,
                      overflow: TextOverflow.clip,
                    ),
                    Text("- ${books.autherName}",
                        style: AppTheme.s2(context)
                            ?.copyWith(color: Colors.white54)),
                    BookRating(reating: books.rating)
                  ],
                ),
              ),
            ),
          )
        : Container();
  }
}
