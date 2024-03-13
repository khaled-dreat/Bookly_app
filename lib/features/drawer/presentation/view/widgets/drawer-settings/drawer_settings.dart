import 'package:clean_arch_bookly_app/features/category/presentation/view/book_categorie/book_categories_view.dart';
import 'package:clean_arch_bookly_app/features/favorite/presentation/view/favorite_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/api/api_key.dart';
import '../../../../../../core/utils/language/app_lang_key.dart';
import '../../../../../../core/utils/routes/app_routes.dart';
import '../../../../../../core/utils/svg/app_svg.dart';
import '../../../../../../core/widgets/dialog/app_dialog.dart';
import '../../../../../webview/web_view.dart';
import 'drawer_setting_design.dart';
import 'lang/drawer_lang.dart';

class DrawerSettings extends StatelessWidget {
  const DrawerSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Column(
        children: [
          // * My App
          DrawerSettingDesign(
            icon: AppSvg.favorite,
            title: AppLangKey.favorite.tr(),
            onTap: () => AppRoutes.go(context, FavoriteView.nameRoute),
          ),
          // * Lang
          DrawerSettingDesign(
            icon: AppSvg.lang,
            title: AppLangKey.language.tr(),
            trailing: const DrawerLang(),
          ),
          // * Category
          DrawerSettingDesign(
            icon: AppSvg.category,
            title: AppLangKey.categories.tr(),
            onTap: () {
              AppRoutes.go(context, BookCategoriesView.nameRoute);
            },
          ),
          // * Terms
          DrawerSettingDesign(
            icon: AppSvg.terms,
            title: AppLangKey.terms.tr(),
            onTap: () {
              AppRoutes.goMaterial(
                context,
                const PageWebView(url: ApiKey.termsUrl),
              );
            },
          ),
          // * Logout
          const Spacer(),
          DrawerSettingDesign(
            icon: AppSvg.logout,
            title: AppLangKey.logout.tr(),
            onTap: () => AppDialog.logout(context),
          ),
          20.verticalSpace
        ],
      ),
    );
  }
}
