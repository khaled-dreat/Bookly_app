import 'package:clean_arch_bookly_app/features/auth/presentation/maneg/auth_cubit/auth_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '';
import '../../utils/language/app_lang.dart';
import '../../utils/language/app_lang_config.dart';
import '../../utils/language/app_lang_key.dart';

class AppDialog {
  static void logout(BuildContext context) {
    AuthCubit pAuth = BlocProvider.of<AuthCubit>(context, listen: false);
    AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      animType: AppLang.currentLang(context) == kEn
          ? AnimType.leftSlide
          : AnimType.rightSlide,
      title: AppLangKey.logout.tr(),
      desc: AppLangKey.messageLogout.tr(),
      btnOkOnPress: () {},
      btnOkText: AppLangKey.cancel.tr(),
      btnCancelOnPress: () {
        Navigator.pop(context);
        pAuth.signOut();
      },
      btnCancelText: AppLangKey.exit.tr(),
      dismissOnTouchOutside: false,
    ).show();
  }
}
