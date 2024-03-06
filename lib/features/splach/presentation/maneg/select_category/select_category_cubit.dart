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
  List<int> itemSelectedIndex = [];

  Box<List<String>> haivSelectedCategory =
      Hive.box<List<String>>(AppHiveKey.selectedCategory);

  Future<void> addSelectedCategory() async {
    // Box<List<int>> haivSelectedCategoryIndex =
    //     Hive.box<List<int>>(AppHiveKey.selectedCategoryIndex);
    log(name: "mmmmmmmmmmmmmmmmmmm", state.toString());
    List<int> indexes = [];
    for (String choice in state) {
      int index = splachSelectedLang.indexOf(choice);
      indexes.add(index);
    }
    log(name: "indexes", indexes.toString());
    List<String> itemSelectedForTest = [];
    String newSelectedForTest;

    for (int choice in indexes) {
      newSelectedForTest = homeSelectedLang[choice];
      itemSelectedForTest.add(newSelectedForTest);
    }

    log(name: "itemSelectedForTest", itemSelectedForTest.toString());
    await haivSelectedCategory.put(
        AppHiveKey.keyselectedCategory, itemSelectedForTest);
  }

  //Future<void> addSelectedCategoryIndex() async {
  //  Box<List<int>> haivSelectedCategoryIndex =
  //      Hive.box<List<int>>(AppHiveKey.selectedCategoryIndex);
  //  await haivSelectedCategoryIndex.put(
  //      AppHiveKey.selectedCategoryIndex, itemSelectedIndex);
  //}

  Future<void> getSelectedCategory() async {
    itemSelected = haivSelectedCategory.get(AppHiveKey.keyselectedCategory)!;
    log(name: "getSelectedCategory itemSelected", itemSelected.toString());
  }

// Future<void> getSelectedCategoryIndex() async {
//   Box<List<int>> haivSelectedCategoryIndex =
//       Hive.box<List<int>>(AppHiveKey.selectedCategoryIndex);
//   itemSelectedIndex =
//       haivSelectedCategoryIndex.get(AppHiveKey.selectedCategoryIndex)!;
// }

  void updateSelectedCategoryChoices(List<String> categoryChoices) {
    if (categoryChoices.length > 1) {
      if (categoryChoices.length >= 4) {
        return;
      }
      if (itemSelected.contains(categoryChoices.last)) {
        itemSelected.remove(categoryChoices.first);
        //  itemSelectedIndex.remove(category.first);
      } else {
        itemSelected.add(categoryChoices.first);
        //       itemSelectedIndex.add(category.first);
      }
      emit(categoryChoices);
    } else {
      emit(categoryChoices);
    }
    log(itemSelectedIndex.toString());
    log(itemSelected.toString());
  }
}
