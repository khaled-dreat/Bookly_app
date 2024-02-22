import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/constant/app_icons.dart';

import '../../../../../core/utils/validators/app_validators.dart';
import '../../../../../core/widgets/text_form/text_form_field.dart';
import '../../maneg/auth_cubit/auth_cubit.dart';

class AuthFieldEmail extends StatelessWidget {
  const AuthFieldEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthCubit cAuth = context.read<AuthCubit>();
    return CustomTextForm(
      label: "Email",
      preIcon: AppIcons.mail,
      validator: AppValidators.isEmail,
      keyboardType: TextInputType.emailAddress,
      onSaved: cAuth.userAuth.setEmail,
    );
  }
}
