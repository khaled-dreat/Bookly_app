import '../language/app_lang_key.dart';

List<String> choicesSearchBy = [
  AppLangKey.title,
  AppLangKey.auther,
  AppLangKey.inPublisher,
  AppLangKey.sBNNumber,
  AppLangKey.iCCNNumber,
  AppLangKey.oCLCnumber,
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

List<String> selectedLang = [
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
