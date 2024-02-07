import 'package:clean_arch_bookly_app/core/utils/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/select_category_view_body.dart';

class SelectCategoryView extends StatelessWidget {
  static const String nameRoute = "SelectCategoryView";
  const SelectCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: BtnAddSelectedCategory(),
      body: SafeArea(child: SelectCategoryViewBody()),
    );
  }
}

class BtnAddSelectedCategory extends StatelessWidget {
  const BtnAddSelectedCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => null,
      child: Container(
        height: 35.h,
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        decoration: BoxDecoration(
            gradient: AppColors.buttonGradi,
            // border: Border.all(
            //     width: 2.0, color: theme.primaryColor),
            borderRadius: BorderRadius.circular(15)),
        child: Text(
          'Finish',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 19.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.textColor,
          ),
        ),
      ),
    );
  }
}
