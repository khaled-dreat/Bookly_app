import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/dime/app_dime.dart';
import '../../core/utils/language/app_lang_key.dart';
import '../../core/widgets/loading/app_loading.dart';
import '../profile/presentation/views/widgets/custom_btn.dart';
import 'widgets/auth_app_bar.dart';
import 'widgets/auth_app_icon.dart';
import 'widgets/auth_field_email.dart';
import 'widgets/auth_field_pass.dart';
import 'widgets/auth_footer.dart';

class PageRegister extends StatefulWidget {
  static const String nameRoute = 'PageRegister';
  static final GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  const PageRegister({super.key});

  @override
  State<PageRegister> createState() => _PageRegisterState();
}

class _PageRegisterState extends State<PageRegister> {
  bool isShow = false;
  @override
  Widget build(BuildContext context) {
    // ControllerAuth pAuth = Provider.of<ControllerAuth>(context);

    return Scaffold(
      appBar: AuthAppBar(title: AppLangKey.register),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: AppDime.md.r),
            child: Form(
              key: PageRegister.keyForm,
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
                  // * Space
                  AppDime.lg.verticalSpace,

                  // * Confirm Pass
                  const AuthFieldPass(isConfirm: true),
                  // * Space
                  AppDime.lg.verticalSpace,
                  // * Forgot Pass
                  // * idea from Abdallah
                  // Visibility(
                  //   visible: false,
                  //   child: AuthForgotPass(),
                  //   maintainSize: true,
                  //   maintainAnimation: true,
                  //   maintainState: true,
                  // ),

                  // * Button Sign in
                  // TODO        pAuth.loading
                  //             ? const AppLoading(loading: TypeLoading.send)
                  //             : CustomBtn(
                  //                 title: AppLangKey.register,
                  //                 onTap: () async {
                  //                   if (PageRegister.keyForm.currentState?.validate() ??
                  //                       false) {
                  //                     // ✅
                  //                     PageRegister.keyForm.currentState?.save();
                  //                     if (await pAuth.authMethod(isSignIn: false) !=
                  //                         null) {
                  //                     } else {
                  //                       AppToast.toast(pAuth.errorMessage);
                  //                     }
                  //                   }
                  //                 },
                  //               ),
                  // * Space
                  AppDime.lg.verticalSpace,
                  // * Footer
                  AuthFooter(
                    first: AppLangKey.haveAccount,
                    second: AppLangKey.login,
                    onTap: () {
                      Navigator.pop(context);
                    },
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
