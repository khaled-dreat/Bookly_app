import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'select_category_state.dart';

class SelectCategoryCubit extends Cubit<List<String>> {
  SelectCategoryCubit() : super([]);
  List<String> itemCount = [];

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
