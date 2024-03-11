import 'package:clean_arch_bookly_app/core/utils/language/app_lang_key.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/theme/app_color.dart';
import '../../../../../../core/widgets/buttons/custom_button.dart';
import '../../../../domain/entity/book_entity.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.book});
  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    double price = double.parse(((book.price ?? 10) * 0.1).toStringAsFixed(1));

    return Row(
      children: [
        Expanded(
          child: CustomButton(
              text: "$price\$",
              backgroundColor: AppColors.bgWhite,
              textColor: AppColors.bgBlack,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16))),
        ),
        Expanded(
          child: CustomButton(
              fontSize: 16.sp,
              text: AppLangKey.free.tr(),
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
