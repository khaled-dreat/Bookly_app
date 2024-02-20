import '../language/app_lang_key.dart';
import 'package:validators/validators.dart' as validators;

class AppValidators {
  // * message Error
  static final String messageEnterValue = AppLangKey.enterValue;
  static final String messageCorrectEmail = AppLangKey.errorEmail;
  static final String messageCorrectPass = AppLangKey.errorPass;
  static final String messageConfirmPass = AppLangKey.errorConfirmPass;

  static String? isEmail(String? value) => templateValidator(
      value, !validators.isEmail(value ?? ''), messageCorrectEmail);

  static String? checkPass(String? value) => templateValidator(
      value, !validators.isLength(value ?? '', 6, 12), messageCorrectPass);

  static String? checkConfirmPass(String? value, String? pass) =>
      templateValidator(
          value, !validators.equals(value?.trim(), pass), messageConfirmPass);

  // * validator
  static String? templateValidator(
      String? value, bool condition, String errorMsg) {
    if (value?.isEmpty ?? true) {
      return messageEnterValue;
    } else if (condition) {
      return errorMsg;
    }
    return null;
  }
}
