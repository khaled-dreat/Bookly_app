import 'package:bloc/bloc.dart';

part 'category_books_state.dart';

class CategoryCubit extends Cubit<List<String>> {
  CategoryCubit() : super([]);
  int count() {
    return state.length;
  }

  void updateSelectedCategoryChoices(List<String> categoryChoices) {
    emit(categoryChoices);
  }
}

class SearchhByCubit extends Cubit<String> {
  SearchhByCubit() : super("");
  int count() {
    if (state.isEmpty) {
      return 0;
    } else {
      return 1;
    }
  }

  void updateSelectedSearchByChoices(String searchByChoices) {
    emit(searchByChoices);
  }
}

class IconButtonCubit extends Cubit<int?> {
  IconButtonCubit() : super(null);

  void numOfSelectedSetting(int value) {
    emit(value);
  }
}
