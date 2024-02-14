import 'package:flutter/material.dart';
import 'widgets/categories_view_body.dart';

class CategoriesView extends StatelessWidget {
  static const String nameRoute = "CategoriesView";
  const CategoriesView({super.key, this.title});
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("$title Books")),
      body: const CategoriesViewBody(),
    );
  }
}
