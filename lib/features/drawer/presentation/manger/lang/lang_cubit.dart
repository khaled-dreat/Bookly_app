import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/utils/language/app_lang_key.dart';

part 'lang_state.dart';

enum ChoiceLang {
  en(AppLangKey.english),
  ar(AppLangKey.arabic);

  final String nameLang;
  const ChoiceLang(this.nameLang);
}

class LangCubit extends Cubit<LangState> {
  LangCubit() : super(LangInitial());
}
