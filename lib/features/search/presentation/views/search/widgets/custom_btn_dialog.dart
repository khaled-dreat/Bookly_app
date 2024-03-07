import 'package:clean_arch_bookly_app/core/utils/language/app_lang_key.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../manger/category_books/category_books_cubit.dart';
import '../../../manger/srh_books/srh_books_cubit.dart';

class CustomBtnDialog extends StatelessWidget {
  const CustomBtnDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: Text(AppLangKey.done.tr()),
        onPressed: () {
          onPressed(context);
        });
  }

  void onPressed(BuildContext context) {
    SrhBooksCubit cSrhBooks = context.read<SrhBooksCubit>();
    CategoryCubit cCategory = context.read<CategoryCubit>();
    SearchhByCubit cSearchhBy = context.read<SearchhByCubit>();
    IconButtonCubit cIconButton = context.read<IconButtonCubit>();
    cSrhBooks.changeCategoryChoices(cCategory.state);
    cSrhBooks.changeSearchByChoices(
        cSearchhBy.state == "" ? AppLangKey.title : cSearchhBy.state);
    cIconButton.numOfSelectedSetting(cCategory.count() + cSearchhBy.count());
    Navigator.of(context).pop();
  }
}
