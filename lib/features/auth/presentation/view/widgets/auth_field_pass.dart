import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/constant/app_icons.dart';
import '../../../../../core/utils/language/app_lang_key.dart';
import '../../../../../core/utils/validators/app_validators.dart';
import '../../../../../core/widgets/text_form/text_form_field.dart';
import '../../maneg/auth_cubit/auth_cubit.dart';

class AuthFieldPass extends StatelessWidget {
  const AuthFieldPass({Key? key, this.isConfirm = false}) : super(key: key);
  final bool isConfirm;
  @override
  Widget build(BuildContext context) {
    AuthCubit cAuth = context.read<AuthCubit>();
    return CustomTextForm(
      label: isConfirm ? AppLangKey.confirmPass : AppLangKey.pass,
      preIcon: AppIcons.pass,
      postIcon: cAuth.icon,
      isPass: cAuth.isNotShowPass,
      validator: (value) {
        return isConfirm
            ? AppValidators.checkConfirmPass(value, cAuth.currentPass)
            : AppValidators.checkPass(value);
      },
      onChanged: !isConfirm ? cAuth.setCurrentPass : null,
      onSaved: cAuth.userAuth.setPass,
    );
  }
}
