import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

import '../../../../../core/utils/local_data/app_local_data_key.dart';

part 'select_category_state.dart';

class SelectCategoryCubit extends Cubit<List<String>> {
  SelectCategoryCubit() : super([]);
  List<String> itemCount = [];
  Box<List<String>> haivSelectedCategory =
      Hive.box<List<String>>(AppHiveKey.selectedCategory);

  void addSelectedCategory() async {
    log(name: "addSelectedCategory List", state.toString());
    haivSelectedCategory.put("itemCount", state);
  }

  Future<void> getSelectedCategory() async {
    itemCount = haivSelectedCategory.get("itemCount")!;

    log(name: "8888888888888888888888", itemCount.toString());
  }

  void updateSelectedCategoryChoices(List<String> categoryChoices) {
    log(name: "****************", "**************************");
    log(name: "itemCount", itemCount.length.toString());
    log(name: "categoryChoices", categoryChoices.length.toString());
    log(name: "state", state.length.toString());

    if (categoryChoices.length > 1) {
      if (categoryChoices.length >= 4) {
        return; // توقف عملية الإضافة عندما يصبح حجمها أكبر من أو يساوي 3
      }
      if (itemCount.contains(categoryChoices.last)) {
        itemCount
            .remove(categoryChoices.first); // حذف القيمة إذا تكررت في القائمة
      } else {
        itemCount.add(categoryChoices.first); // إضافة القيمة إلى القائمة
      }

      emit(categoryChoices);
    } else {
      emit(categoryChoices);
    }
    log(name: "Final List", state.toString());
  }
}
