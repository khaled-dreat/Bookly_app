import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../../../core/utils/local_data/app_local_data_key.dart';

class SelectCategoryCubit extends Cubit<List<String>> {
  SelectCategoryCubit() : super([]);
  List<String> itemSelected = [];

  Box<List<String>> haivSelectedCategory =
      Hive.box<List<String>>(AppHiveKey.selectedCategory);

  Future<void> addSelectedCategory() async {
    await haivSelectedCategory.put(AppHiveKey.keyselectedCategory, state);
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
