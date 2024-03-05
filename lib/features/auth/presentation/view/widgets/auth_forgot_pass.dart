import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/language/app_lang_key.dart';
import '../../../../../core/utils/routes/app_routes.dart';
import '../../../../../core/utils/theme/app_theme.dart';

import '../forgot_pass.dart';

class AuthForgotPass extends StatelessWidget {
  const AuthForgotPass({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: TextButton(
        onPressed: () {
          AppRoutes.go(context, PageForgotPass.nameRoute);
        },
        child: Text(
          AppLangKey.forgotPass.tr(),
          style: AppTheme.b1(context)?.copyWith(
            color: AppTheme.colorAuth(context),
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
