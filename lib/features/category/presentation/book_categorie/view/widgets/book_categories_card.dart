import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/constant/app_catogre.dart';
import '../../../../../../core/utils/theme/app_color.dart';
import '../../../../../../core/utils/theme/app_theme.dart';

class BookCategoriesCard extends StatelessWidget {
  const BookCategoriesCard({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: AppColors.bgWhite,
            borderRadius: const BorderRadius.all(Radius.circular(25))),
        child: Text(
          selectedLang.elementAt(index).tr(),
          textAlign: TextAlign.center,
          style: AppTheme.h5(context)!.copyWith(
              color: AppColors.primaryColor, fontWeight: FontWeight.w700),
        ));
  }
}
