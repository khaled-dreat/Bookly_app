import 'package:clean_arch_bookly_app/features/auth/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/dime/app_dime.dart';
import '../../core/utils/language/app_lang_key.dart';
import '../../core/utils/routes/app_routes.dart';
import '../../core/widgets/loading/app_loading.dart';
import '../profile/presentation/views/widgets/custom_btn.dart';
import 'widgets/auth_app_bar.dart';
import 'widgets/auth_app_icon.dart';
import 'widgets/auth_field_email.dart';
import 'widgets/auth_field_pass.dart';
import 'widgets/auth_footer.dart';
import 'widgets/auth_forgot_pass.dart';

class PageSignIn extends StatelessWidget {
  static const String nameRoute = 'PageSignIn';
  static final GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  const PageSignIn({super.key});
  @override
  Widget build(BuildContext context) {
    //  ControllerAuth pAuth = Provider.of<ControllerAuth>(context);

    return Scaffold(
      appBar: AuthAppBar(title: "AppLangKey.login"),
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
                  // * Email
                  const AuthFieldEmail(),
                  // * Space
                  AppDime.lg.verticalSpace,
                  // * Pass
                  const AuthFieldPass(),
                  // * Forgot Pass
                  const AuthForgotPass(),

                  // * Button Sign in
                  //   TODO       pAuth.loading
                  //              ? const AppLoading(loading: TypeLoading.send)
                  //              : CustomBtn(
                  //                  title: AppLangKey.login,
                  //                  onTap: () async {
                  //                    if (keyForm.currentState?.validate() ?? false) {
                  //                      // ✅

                  //                      keyForm.currentState?.save();
                  //                      if (await pAuth.authMethod() != null) {
                  //                      } else {
                  //                        AppToast.toast(pAuth.errorMessage);
                  //                      }
                  //                    }
                  //                  },
                  //                ),
                  // * Space
                  AppDime.lg.verticalSpace,
                  // * Footer
                  AuthFooter(
                    first: AppLangKey.notAccount,
                    second: AppLangKey.register,
                    onTap: () => AppRoutes.go(context, PageRegister.nameRoute),
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
