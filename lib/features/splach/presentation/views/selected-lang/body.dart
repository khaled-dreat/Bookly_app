import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/language/app_lang_config.dart';
import '../../../../../core/utils/language/app_lang_key.dart';
import '../../../../../core/utils/theme/app_theme.dart';
import 'widgets/flag_lang.dart';

class PageSelectedLang extends StatelessWidget {
  static const nameRoute = 'PageSelectedLang';
  const PageSelectedLang({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppLangKey.selectLanguage,
            style: AppTheme.h5(context)?.copyWith(fontWeight: FontWeight.bold),
          ).tr(),
          Row(
            children: [
              // * English
              FlagLang(lang: kEn),
              // * Arabic
              FlagLang(lang: kAr),
            ],
          ),
        ],
      ),
    );
  }
}
