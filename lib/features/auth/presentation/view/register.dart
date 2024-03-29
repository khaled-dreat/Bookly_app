import 'dart:developer';
import 'package:clean_arch_bookly_app/core/utils/routes/app_routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/dime/app_dime.dart';
import '../../../../core/utils/language/app_lang_key.dart';
import '../../../profile/presentation/views/widgets/custom_btn.dart';
import '../../../splach/presentation/views/select_category/select_category_view.dart';
import '../maneg/auth_cubit/auth_cubit.dart';
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
    AuthCubit? authCubit = context.read<AuthCubit>();
    return Scaffold(
      appBar: AuthAppBar(title: AppLangKey.register.tr()),
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

                  // * Button Sign in
                  CustomBtn(
                    title: AppLangKey.register.tr(),
                    onTap: () async {
                      if (PageRegister.keyForm.currentState?.validate() ??
                          false) {
                        // ✅
                        log("✅");
                        PageRegister.keyForm.currentState?.save();
                        if (await authCubit.authMethod(isSignIn: false) !=
                            null) {
                          AppRoutes.goReplace(
                              context, SelectCategoryView.nameRoute);
                        }
                      }
                    },
                  ),
                  // * Space
                  AppDime.lg.verticalSpace,
                  // * Footer
                  AuthFooter(
                    first: AppLangKey.haveAccount.tr(),
                    second: AppLangKey.login.tr(),
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
