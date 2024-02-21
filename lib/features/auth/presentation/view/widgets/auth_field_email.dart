import 'package:flutter/material.dart';

import '../../../../../core/utils/constant/app_icons.dart';

import '../../../../../core/utils/validators/app_validators.dart';
import '../../../../../core/widgets/text_form/text_form_field.dart';

class AuthFieldEmail extends StatelessWidget {
  const AuthFieldEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextForm(
      label: "Email",
      preIcon: AppIcons.mail,
      validator: AppValidators.isEmail,
      keyboardType: TextInputType.emailAddress,
      // TODO  onSaved: pAuth.userAuth.setEmail,
    );
  }
}
