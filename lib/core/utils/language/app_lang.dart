import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AppLang {
  ///  [currentLang] return en or ar
  static String currentLang(BuildContext context) =>
      context.locale.languageCode;

  /// [setLang] change lang
  static void setLang(BuildContext context, Locale locale) =>
      context.setLocale(locale);

  static const String keyShowLang = 'SHOWLANG';
  Box<bool> haivSelectedLang = Hive.box<bool>(keyShowLang);

  /// [setShowLang] save key show lang  is false stop show selected lang
  static Future<void> setShowLang() async {
    Box<bool> haivSelectedLang = Hive.box<bool>(keyShowLang);
    await haivSelectedLang.put(keyShowLang, false);
  }

  /// [showSelectLang] get data saved in locale device
  static Future<bool> get showSelectLang async {
    Box<bool> haivSelectedLang = Hive.box<bool>(keyShowLang);
    return haivSelectedLang.get(keyShowLang) ?? true;
  }
}
