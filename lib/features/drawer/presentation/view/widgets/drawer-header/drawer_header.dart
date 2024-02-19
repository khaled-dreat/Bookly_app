import 'package:clean_arch_bookly_app/core/utils/constant/app_images.dart';
import 'package:clean_arch_bookly_app/core/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/dime/app_dime.dart';
import '../../../../../../core/widgets/images/image_profile.dart';

class DrawerHeade extends StatelessWidget {
  const DrawerHeade({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            8.verticalSpace,
            SizedBox(
              height: 40.h,
              child: Image.asset(
                AppImages.booklyLogoLight,
              ),
            ),
            // * sizedBox height 4dp
            // * Image Profile
            25.verticalSpace,
            //*     Information Profile
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 65.h, child: ImageProfile()),
                  20.horizontalSpace,
                  // * Name
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "Khaled Deat",
                          style: AppTheme.h6(context),
                        ),
                        // * sizedBox height 8dp
                        AppDime.md.verticalSpace,
                        // * Email
                        Text(
                          'dreatkhaled@gmail.com',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTheme.b2(context),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
