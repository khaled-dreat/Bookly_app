import 'package:flutter/material.dart';
import 'widgets/book_categories_view_body.dart';

class BookCategoriesView extends StatelessWidget {
  static const String nameRoute = "BookCategoriesView";
  const BookCategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: BookCategoriesViewBody(),
      ),
    );
  }
}
