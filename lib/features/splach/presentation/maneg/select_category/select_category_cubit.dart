import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import '../../../../../core/utils/constant/app_catogre.dart';
import '../../../../../core/utils/local_data/app_local_data_key.dart';
part 'select_category_state.dart';

class SelectCategoryCubit extends Cubit<List<String>> {
  SelectCategoryCubit() : super([]);
  List<String> itemSelected = [];

  Box<List<String>> haivSelectedCategory =
      Hive.box<List<String>>(AppHiveKey.selectedCategory);

  Future<void> addSelectedCategory() async {
    // * For loob for get index of Selected category in splach Selected Lang List
    List<int> indexes = getIndexOfSelectedCategory();

    // * For loob for get name of Selected category in home Selected Lang List
    List<String> itemSelectedForTest = [];
    String newSelectedForTest = "";

    getNameOfSelectedCategory(indexes, newSelectedForTest, itemSelectedForTest);

    await haivSelectedCategory.put(
        AppHiveKey.keyselectedCategory, itemSelectedForTest);
  }

  void getNameOfSelectedCategory(List<int> indexes, String newSelectedForTest,
      List<String> itemSelectedForTest) {
    for (int choice in indexes) {
      newSelectedForTest = homeSelectedLang[choice];
      itemSelectedForTest.add(newSelectedForTest);
    }
  }

  List<int> getIndexOfSelectedCategory() {
    List<int> indexes = [];
    for (String choice in state) {
      int index = splachSelectedLang.indexOf(choice);
      indexes.add(index);
    }
    return indexes;
  }

  Future<void> getSelectedCategory() async {
    itemSelected = haivSelectedCategory.get(AppHiveKey.keyselectedCategory)!;
  }

  void updateSelectedCategoryChoices(List<String> categoryChoices) {
    if (categoryChoices.length > 1) {
      if (categoryChoices.length >= 4) {
        return;
      }
      if (itemSelected.contains(categoryChoices.last)) {
        itemSelected.remove(categoryChoices.first);
      } else {
        itemSelected.add(categoryChoices.first);
      }
      emit(categoryChoices);
    } else {
      emit(categoryChoices);
    }
  }
}
