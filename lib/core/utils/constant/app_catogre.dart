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
    AppLangKey.title: "intitle",
    AppLangKey.auther: "inauthor",
    AppLangKey.inPublisher: "inpublisher",
    AppLangKey.sBNNumber: "isbn",
    AppLangKey.iCCNNumber: "lccn",
    AppLangKey.oCLCnumber: "oclc",
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
