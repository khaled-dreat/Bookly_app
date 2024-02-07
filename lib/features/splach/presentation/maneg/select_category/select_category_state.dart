part of 'select_category_cubit.dart';

@immutable
abstract class SelectCategoryState {}

class SelectCategoryInitial extends SelectCategoryState {}

class SelectCategory extends SelectCategoryState {
  final List<String> selectCategoryChoices;

  SelectCategory({required this.selectCategoryChoices});
}
