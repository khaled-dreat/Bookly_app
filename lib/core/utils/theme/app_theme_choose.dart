import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color.dart';

class AppThemeChoose {
  // * Font Family Lang
  // static String? enFont = GoogleFonts.aBeeZee().fontFamily;
  // static String? arFont = GoogleFonts.cairo().fontFamily;

  // * Check Lang
  //static String? fontFamily(BuildContext context) =>
  //    AppLang.currentLang(context) == kEn ? enFont : arFont;

  // * Light
  static ThemeData light(BuildContext context) {
    return ThemeData.light().copyWith(
      // * scaffold Background Color
      scaffoldBackgroundColor: AppColors.primaryColor,
      // * appBar Theme
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.bgWhite,
        foregroundColor: AppColors.bgBlack,
        elevation: 10,
        centerTitle: true,
        titleTextStyle: Theme.of(context).textTheme.titleLarge,
      ),
      //  *  card theme
      cardTheme: const CardTheme(
        elevation: 5,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
            //      borderRadius: BorderRadius.circular(AppDime.lg.r),
            ),
      ),
      // * text Theme

      textTheme: GoogleFonts.montserratTextTheme(),
      // * tab bar theme
      tabBarTheme: TabBarTheme(
        labelColor: AppColors.bgBlack,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: AppColors.lightTab, width: 3),
        ),
      ),
    );
  }

  // * Dark
  static ThemeData dark(BuildContext context) {
    // * appBar Theme
    return ThemeData.dark().copyWith(
      // * scaffold Background Color
      scaffoldBackgroundColor: AppColors.primaryColor,
      appBarTheme: AppBarTheme(
        elevation: 10,
        centerTitle: true,
        titleTextStyle: Theme.of(context)
            .textTheme
            .titleLarge
            ?.copyWith(color: AppColors.bgWhite),
      ),
      //  *  card theme
      cardTheme: const CardTheme(
        elevation: 5,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(AppDime.lg.r),
            ),
      ),

      // * text Theme

      textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),

      // * tab bar theme
      tabBarTheme: TabBarTheme(
        labelColor: AppColors.bgWhite,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: AppColors.darkTab, width: 3),
        ),
      ),
    );
  }
}
