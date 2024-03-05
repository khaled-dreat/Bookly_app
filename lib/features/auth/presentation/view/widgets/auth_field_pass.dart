import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/constant/app_icons.dart';
import '../../../../../core/utils/language/app_lang_key.dart';
import '../../../../../core/utils/validators/app_validators.dart';
import '../../../../../core/widgets/text_form/text_form_field.dart';
import '../../maneg/auth_cubit/auth_cubit.dart';

class AuthFieldPass extends StatelessWidget {
  const AuthFieldPass({super.key, this.isConfirm = false});
  final bool isConfirm;
  @override
  Widget build(BuildContext context) {
    AuthCubit cAuth = context.read<AuthCubit>();
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return CustomTextForm(
          label: isConfirm ? AppLangKey.confirmPass.tr() : AppLangKey.pass.tr(),
          preIcon: AppIcons.pass,
          postIcon: cAuth.icon,
          isPass: state is AuthisNotShowPass
              ? state.isNotShowPass
              : cAuth.isNotShowPass,
          validator: (value) {
            return isConfirm
                ? AppValidators.checkConfirmPass(value, cAuth.currentPass)
                : AppValidators.checkPass(value);
          },
          onChanged: !isConfirm ? cAuth.setCurrentPass : null,
          onSaved: cAuth.userAuth.setPass,
        );
      },
    );
  }
}
