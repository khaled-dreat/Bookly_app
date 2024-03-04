import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/language/app_lang.dart';
import '../../../../../core/utils/language/app_lang_config.dart';
import '../../../../../core/utils/language/app_lang_key.dart';
import '../../../../../core/utils/restart/app_restart.dart';
import '../../../../../core/utils/theme/app_color.dart';
import '../../../../../core/utils/theme/app_theme.dart';
import '../../../../../core/widgets/toast/app_toast.dart';

class LangCubit extends Cubit<ChoiceLang> {
  LangCubit() : super(ChoiceLang.ar);
  // * UI Widget
  ChoiceLang? lang;

  // * check lang used easy locale
  void checkLang(BuildContext context) {
    lang = AppLang.currentLang(context) == kEn ? ChoiceLang.en : ChoiceLang.ar;
    emit(AppLang.currentLang(context) == kEn ? ChoiceLang.en : ChoiceLang.ar);
  }

  // * change lang
  void changeLang(BuildContext context, {required ChoiceLang lang}) {
    if (lang != this.lang) {
      this.lang = lang;

      context.setLocale(lang == ChoiceLang.en
          ? AppLangConfig.enLocale
          : AppLangConfig.arLocale);
      AppRestart.reBuild(context);
    } else {
      AppToast.toast(AppLangKey.chosenLang.tr(),
          color: AppTheme.isDark(context)
              ? AppColors.darkTab
              : AppColors.lightTab);
    }
  }
}

enum ChoiceLang {
  en(AppLangKey.english),
  ar(AppLangKey.arabic);

  final String nameLang;
  const ChoiceLang(this.nameLang);
}
