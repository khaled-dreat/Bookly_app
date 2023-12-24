import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/theme/app_color.dart';
import '../../../../../../core/widgets/buttons/custom_button.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
              text: "19.00\$",
              backgroundColor: AppColors.bgWhite,
              textColor: AppColors.bgBlack,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16))),
        ),
        Expanded(
          child: CustomButton(
              fontSize: 16.sp,
              text: "Free",
              backgroundColor: const Color(0xffEF8262),
              textColor: AppColors.bgWhite,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              )),
        ),
      ],
    );
  }
}
