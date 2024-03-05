import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/dime/app_dime.dart';
import '../../../../core/utils/language/app_lang_key.dart';
import '../../../../core/utils/theme/app_theme.dart';

import '../../../profile/presentation/views/widgets/custom_btn.dart';
import '../maneg/auth_cubit/auth_cubit.dart';
import 'widgets/auth_app_bar.dart';
import 'widgets/auth_app_icon.dart';
import 'widgets/auth_field_email.dart';
import 'widgets/auth_footer.dart';

class PageForgotPass extends StatelessWidget {
  static const String nameRoute = 'PageForgotPass';
  static final GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  const PageForgotPass({super.key});
  @override
  Widget build(BuildContext context) {
    //  ControllerAuth pAuth = Provider.of<ControllerAuth>(context);

    return Scaffold(
      appBar: AuthAppBar(title: AppLangKey.forgotPass.tr()),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: AppDime.md.r),
            child: Form(
              key: keyForm,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // * Space
                  AppDime.lg.verticalSpace,
                  // * logo
                  const AuthAppIcon(),
                  // * Space
                  AppDime.lg.verticalSpace,
                  // * hint Reset pass
                  Text(
                    AppLangKey.hintResetPass.tr(),
                    textAlign: TextAlign.center,
                    style: AppTheme.s1(context)?.copyWith(height: 1.5),
                  ),
                  // * Space
                  AppDime.lg.verticalSpace,
                  // * Email
                  const AuthFieldEmail(),
                  // * Space
                  AppDime.lg.verticalSpace,
                  // * Button Sign in
                  CustomBtn(
                    title: AppLangKey.send.tr(),
                    onTap: () async {
                      if (keyForm.currentState?.validate() ?? false) {
                        // ✅

                        keyForm.currentState?.save();
                        await context.read<AuthCubit>().resetPass();
                        Navigator.pop(context);
                      }
                    },
                  ),
                  // * Space
                  AppDime.lg.verticalSpace,
                  // * Footer
                  AuthFooter(
                    first: AppLangKey.haveAccount.tr(),
                    second: AppLangKey.login.tr(),
                    onTap: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
