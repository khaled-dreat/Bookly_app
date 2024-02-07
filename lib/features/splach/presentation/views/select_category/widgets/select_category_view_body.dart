import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/constant/app_catogre.dart';
import '../../../../../search/presentation/manger/category_books/category_books_cubit.dart';
import '../../../maneg/select_category/select_category_cubit.dart';

class SelectCategoryViewBody extends StatelessWidget {
  const SelectCategoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectCategoryCubit, List<String>>(
      builder: (context, state) {
        return ChipsChoice<String>.multiple(
          value: state,
          wrapped: true,
          onChanged: (val) {
            context
                .read<SelectCategoryCubit>()
                .updateSelectedCategoryChoices(val);
          },
          choiceItems: C2Choice.listFrom<String, String>(
            source: choices,
            value: (i, v) => v,
            label: (i, v) => v,
          ),
        );
      },
    );
  }
}
