import 'package:flutter/material.dart';

import '../../../../../core/utils/constant/app_icons.dart';
import '../../../../../core/utils/language/app_lang_key.dart';
import '../../../../../core/widgets/text_form/text_form_field.dart';

class AuthFieldPass extends StatelessWidget {
  const AuthFieldPass({Key? key, this.isConfirm = false}) : super(key: key);
  final bool isConfirm;
  @override
  Widget build(BuildContext context) {
    // ControllerAuth pAuth = Provider.of<ControllerAuth>(context);
    return CustomTextForm(
      label: isConfirm ? AppLangKey.confirmPass : AppLangKey.pass,
      preIcon: AppIcons.pass,
      // TODO    postIcon: pAuth.icon,
      // TODO  isPass: pAuth.isNotShowPass,
      // TODO   validator: (value) {
      //     return isConfirm
      //         ? AppValidators.checkConfirmPass(value, pAuth.currentPass)
      //         : AppValidators.checkPass(value);
      //   },
      // TODO onChanged: !isConfirm ? pAuth.setCurrentPass : null,
      // TODO     onSaved: pAuth.userAuth.setPass,
    );
  }
}
