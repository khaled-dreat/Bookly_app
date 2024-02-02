import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/constant/app_catogre.dart';
import '../../../../../../core/utils/theme/app_theme.dart';
import '../../../manger/category_books/category_books_cubit.dart';
import '../../../manger/srh_books/srh_books_cubit.dart';

class CustomSrhDialog {
  static void showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: SizedBox(
          width: 250.w,
          height: 360.h,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  "Custom search",
                  style: AppTheme.h6(context),
                ),
                const Divider(height: 15, thickness: 3),
                SizedBox(
                  height: 270.h,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Center(
                        child: Text(
                          "Search By",
                          style: AppTheme.s1(context),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 45.0),
                        child: Divider(
                          indent: 40,
                        ),
                      ),
                      // * Search By Section
                      const SearchBySectionSrh(),
                      // * Category Section
                      const CategorySectionSrh(),
                    ],
                  ),
                ),
                // * Custom Btn Dialog
                const CustomBtnDialog()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
            context.read<SearchhByCubit>().updateSelectedSearchByChoices(val);
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

class CategorySectionSrh extends StatelessWidget {
  const CategorySectionSrh({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: EdgeInsets.only(left: 90.r),
      title: const Text("Category"),
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
                source: choices,
                value: (i, v) => v,
                label: (i, v) => v,
              ),
            );
          },
        ),
      ],
    );
  }
}

class CustomBtnDialog extends StatelessWidget {
  const CustomBtnDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: const Text('Done'),
        onPressed: () {
          context
              .read<SrhBooksCubit>()
              .changeCategoryChoices(context.read<CategoryCubit>().state);
          context
              .read<SrhBooksCubit>()
              .changeSearchByChoices(context.read<SearchhByCubit>().state);
          Navigator.of(context).pop();
        });
  }
}
