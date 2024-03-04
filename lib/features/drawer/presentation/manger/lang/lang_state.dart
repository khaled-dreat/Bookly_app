/*
part of 'lang_cubit.dart';

@immutable
sealed class LangState {}

final class LangInitial extends LangState {}

final class LangcheckLangSuccess extends LangState {
  final ChoiceLang lang;

  LangcheckLangSuccess({required this.lang});
}

final class LangcheckLangFailure extends LangState {}
/*