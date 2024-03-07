import 'package:chips_choice/chips_choice.dart';
import 'package:clean_arch_bookly_app/core/utils/language/app_lang_key.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/constant/app_catogre.dart';
import '../../../manger/category_books/category_books_cubit.dart';

class CategorySectionSrh extends StatelessWidget {
  const CategorySectionSrh({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: EdgeInsets.only(left: 90.r),
      title: Text(AppLangKey.categories.tr()),
      children: [
        BlocBuilder<CategoryCubit, List<String>>(
          builder: (context, state) {
            return ChipsChoice<String>.multiple(
              value: state,
              wrapped: true,
              onChanged: (val) {
                context
                    .read<CategoryCubit>()
                    .updateSelectedCategoryChoices(val);
              },
              choiceItems: C2Choice.listFrom<String, String>(
                source: selectedLang,
                value: (i, v) => v,
                label: (i, v) => v.tr(),
              ),
            );
          },
        ),
      ],
    );
  }
}
