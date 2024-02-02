import 'dart:developer';

import 'package:bloc/bloc.dart';

part 'category_books_state.dart';

class CategoryCubit extends Cubit<List<String>> {
  CategoryCubit() : super([]);

  void updateSelectedCategoryChoices(List<String> categoryChoices) {
    log(name: "Update Selected Category Choices", categoryChoices.toString());

    emit(categoryChoices);
  }
}

class SearchhByCubit extends Cubit<String> {
  SearchhByCubit() : super("");

  void updateSelectedSearchByChoices(String searchByChoices) {
    emit(searchByChoices);
  }
}
