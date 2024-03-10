import 'package:clean_arch_bookly_app/core/utils/language/app_lang_key.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'widgets/categories_view_body.dart';

class CategoriesView extends StatelessWidget {
  static const String nameRoute = "CategoriesView";
  const CategoriesView({super.key, this.title});
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${AppLangKey.book.tr()} $title")),
      body: const CategoriesViewBody(),
    );
  }
}
