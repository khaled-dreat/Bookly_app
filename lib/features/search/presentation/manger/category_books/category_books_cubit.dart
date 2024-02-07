import 'dart:developer';

import 'package:bloc/bloc.dart';

part 'category_books_state.dart';

class CategoryCubit extends Cubit<List<String>> {
  CategoryCubit() : super([]);

  void updateSelectedCategoryChoices(List<String> categoryChoices) {
    emit(categoryChoices);
  }
}

class SearchhByCubit extends Cubit<String> {
  SearchhByCubit() : super("");

  void updateSelectedSearchByChoices(String searchByChoices) {
    //  log(name: "updateSelectedSearchByChoices", searchByChoices);

    emit(searchByChoices);
  }
}
