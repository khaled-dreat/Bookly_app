import 'package:easy_localization/easy_localization.dart';

import '../language/app_lang_key.dart';

List<String> choicesSearchBy = [
  "Title",
  "Auther",
  "In Publisher",
  "SBN Number",
  "ICCN Number",
  "OCLC Number",
];

String? searchByChoicesValue(String key) {
  Map<String, String> choicesSearchBy2 = {
    "Title": "intitle",
    "Author": "inauthor",
    "In Publisher": "inpublisher",
    "SBN Number": "isbn",
    "ICCN Number": "lccn",
    "OCLC Number": "oclc",
  };
  String? value = choicesSearchBy2[key];
  return value;
}

List<String> splachSelectedLang = [
  AppLangKey.msteryAndThrillers.tr(),
  AppLangKey.biographyAndMemoirs.tr(),
  AppLangKey.selfDevelopment.tr(),
  AppLangKey.romance.tr(),
  AppLangKey.fantasy.tr(),
  AppLangKey.history.tr(),
  AppLangKey.philosophy.tr(),
  AppLangKey.religionAndSpirituality.tr(),
  AppLangKey.artAndDesign.tr(),
  AppLangKey.businessAndFinance.tr(),
  AppLangKey.healthAndWellness.tr(),
  AppLangKey.scienceAndTechnology.tr(),
  AppLangKey.politicsAndGovernment.tr(),
  AppLangKey.sportsAndRecreation.tr(),
  AppLangKey.childrensBooks.tr(),
];

List<String> homeSelectedLang = [
  AppLangKey.msteryAndThrillers,
  AppLangKey.biographyAndMemoirs,
  AppLangKey.selfDevelopment,
  AppLangKey.romance,
  AppLangKey.fantasy,
  AppLangKey.history,
  AppLangKey.philosophy,
  AppLangKey.religionAndSpirituality,
  AppLangKey.artAndDesign,
  AppLangKey.businessAndFinance,
  AppLangKey.healthAndWellness,
  AppLangKey.scienceAndTechnology,
  AppLangKey.politicsAndGovernment,
  AppLangKey.sportsAndRecreation,
  AppLangKey.childrensBooks,
];
