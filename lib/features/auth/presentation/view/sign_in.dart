import 'dart:developer';

import 'package:clean_arch_bookly_app/core/widgets/toast/app_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/dime/app_dime.dart';
import '../../../../core/utils/language/app_lang_key.dart';
import '../../../../core/utils/routes/app_routes.dart';

import '../../../../core/widgets/loading/app_loading.dart';
import '../../../profile/presentation/views/widgets/custom_btn.dart';
import '../maneg/auth_cubit/auth_cubit.dart';
import '../maneg/wrapper_cubit/wrapper_cubit.dart';
import 'register.dart';
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
      appBar: AuthAppBar(title: AppLangKey.login),
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
                  AppDime.xxl.verticalSpace,
                  // * logo
                  const AuthAppIcon(),
                  // * Space
                  AppDime.xxl.verticalSpace,
                  // * Email
                  const AuthFieldEmail(),
                  // * Space
                  AppDime.xlg.verticalSpace,
                  // * Pass
                  const AuthFieldPass(),
                  // * Forgot Pass
                  const AuthForgotPass(),

                  // * Button Sign in

                  CustomBtn(
                    title: AppLangKey.login,
                    onTap: () async {
                      keyForm.currentState?.save();
                      await context.read<AuthCubit>().authMethod();

                      if (keyForm.currentState?.validate() ?? false) {
                        // ✅
                        log("✅");
                        BlocBuilder<AuthCubit, AuthState>(
                            builder: (context, state) {
                          if (state is AuthFailure) {
                            return AppToast.toast(state.errMessage);
                          } else if (state is AuthLoading) {
                            return const AppLoading(loading: TypeLoading.send);
                          }
                          return const AppLoading(loading: TypeLoading.send);
                        });
                      }
                    },
                  ),
                  // * Space
                  AppDime.xxxi.verticalSpace,
                  AppDime.xlg.verticalSpace,
                  // * Footer
                  AuthFooter(
                    first: AppLangKey.notAccount,
                    second: AppLangKey.register,
                    onTap: () {
                      AppRoutes.go(context, PageRegister.nameRoute);
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
