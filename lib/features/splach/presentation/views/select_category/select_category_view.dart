import 'package:clean_arch_bookly_app/core/utils/language/app_lang_key.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'widgets/btn_add_selected_category.dart';
import 'widgets/select_category_view_body.dart';

class SelectCategoryView extends StatelessWidget {
  static const String nameRoute = "SelectCategoryView";
  const SelectCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLangKey.selectCategories.tr())),
      bottomNavigationBar: const BtnAddSelectedCategory(),
      body: const SafeArea(child: SelectCategoryViewBody()),
    );
  }
}
