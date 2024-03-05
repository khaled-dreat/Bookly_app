import 'package:clean_arch_bookly_app/features/auth/presentation/view/wrapper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/constant/app_images.dart';
import '../../../../../../core/utils/dime/app_dime.dart';
import '../../../../../../core/utils/language/app_lang.dart';
import '../../../../../../core/utils/language/app_lang_config.dart';
import '../../../../../../core/utils/language/app_lang_key.dart';
import '../../../../../../core/utils/routes/app_routes.dart';
import '../../../../../../core/utils/theme/app_theme.dart';

class FlagLang extends StatelessWidget {
  const FlagLang({super.key, required this.lang});
  final String lang;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(AppDime.md.r),
        child: InkWell(
          onTap: () {
            // * Change Lang
            AppLang.setLang(context,
                lang == kEn ? AppLangConfig.enLocale : AppLangConfig.arLocale);
            // * change shared preference key to false (false stop show lang)
            AppLang().setShowLang;
            // * Push  Wrapper
            AppRoutes.go(context, WrapperView.nameRoute);
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image(
                image: AssetImage(
                    lang == kEn ? AppImages.unitedStates : AppImages.saudi),
              ),
              Text(
                lang == kEn ? AppLangKey.english : AppLangKey.arabic,
                style:
                    AppTheme.h6(context)?.copyWith(fontWeight: FontWeight.bold),
              ).tr()
            ],
          ),
        ),
      ),
    );
  }
}
