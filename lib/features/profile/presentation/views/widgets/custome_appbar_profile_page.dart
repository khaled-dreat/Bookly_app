import 'package:clean_arch_bookly_app/core/utils/language/app_lang_key.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/theme/app_theme.dart';

class CustomeAppbarProfilePage extends StatelessWidget {
  const CustomeAppbarProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // * Back Btn
        IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close)),
        0.1.sh.horizontalSpace,
        // * Title
        Text(
          AppLangKey.editProfile.tr(),
          style: AppTheme.h5(context)!.copyWith(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
