import 'package:clean_arch_bookly_app/core/utils/constant/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/dime/app_dime.dart';

class AuthAppIcon extends StatelessWidget {
  const AuthAppIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
      image: const AssetImage(AppImages.booklyLogoLight),
      width: AppDime.half.sw,
    );
  }
}
