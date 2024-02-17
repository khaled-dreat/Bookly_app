import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/constant/app_catogre.dart';
import '../../../manger/category_books/category_books_cubit.dart';

class SearchBySectionSrh extends StatelessWidget {
  const SearchBySectionSrh({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchhByCubit, String>(
      builder: (context, state) {
        return ChipsChoice<String>.single(
          value: state,
          wrapped: true,
          onChanged: (val) {
            if (val != state) {
              context.read<SearchhByCubit>().updateSelectedSearchByChoices(val);
            } else {
              context.read<SearchhByCubit>().updateSelectedSearchByChoices("");
            }
          },
          choiceItems: C2Choice.listFrom<String, String>(
            source: choicesSearchBy,
            value: (i, v) => v,
            label: (i, v) => v,
          ),
        );
      },
    );
  }
}
