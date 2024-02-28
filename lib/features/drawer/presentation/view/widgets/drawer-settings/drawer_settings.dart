import 'package:clean_arch_bookly_app/features/favorite/presentation/view/favorite_view.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../../core/utils/routes/app_routes.dart';
import '../../../../../../core/utils/svg/app_svg.dart';
import 'drawer_setting_design.dart';

class DrawerSettings extends StatelessWidget {
  const DrawerSettings({super.key});

  @override
  Widget build(BuildContext context) {
    // Provider theme
    // final ControllerTheme pTheme = Provider.of<ControllerTheme>(context);
    return Expanded(
      flex: 3,
      child: Column(
        children: [
          // * My App
          DrawerSettingDesign(
            icon: AppSvg.favorite,
            title: "Favorite",
            onTap: () => AppRoutes.go(context, FavoriteView.nameRoute),
          ),
          // * Lang
          //       DrawerSettingDesign(
          //         icon: AppSvg.lang,
          //         title: AppLangKey.language,
          //         trailing: const DrawerLang(),
          //       ),
          // * Theme
          //      DrawerSettingDesign(
          //        icon: AppSvg.theme,
          //        title: pTheme.nameTheme,
          //        trailing: const DrawerTheme(),
          //      ),
          // * Terms
          //    DrawerSettingDesign(
          //      icon: AppSvg.terms,
          //      title: AppLangKey.terms,
          //      onTap: () {
          //        AppRoutes.goMaterial(
          //          context,
          //          PageWebView(url: ApiKey.termsUrl(context)),
          //        );
          //      },
          //    ),
          //  * Logout
          //      DrawerSettingDesign(
          //        icon: AppSvg.logout,
          //        title: AppLangKey.logout,
          //        onTap: () => AppDialog.logout(context),
          //      ),
        ],
      ),
    );
  }
}