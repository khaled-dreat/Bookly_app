import 'package:flutter/material.dart';

import 'widgets/select_category_view_body.dart';

class SelectCategoryView extends StatelessWidget {
  static const String nameRoute = "SelectCategoryView";
  const SelectCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: SelectCategoryViewBody()),
    );
  }
}
