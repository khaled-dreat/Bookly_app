import 'dart:async';

import 'package:clean_arch_bookly_app/core/utils/language/app_lang.dart';
import 'package:clean_arch_bookly_app/core/utils/language/app_lang_key.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../../core/utils/routes/app_routes.dart';
import '../../../../../../core/utils/theme/app_color.dart';
import '../../../../../favorite/presentation/manger/favorite_books/favorite_books_cubit.dart';
import '../../../../../home/presentation/view/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../maneg/select_category/select_category_cubit.dart';

class BtnAddSelectedCategory extends StatelessWidget {
  const BtnAddSelectedCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectCategoryCubit, List<String>>(
      builder: (context, state) {
        return InkWell(
          onTap: () async {
            if (state.length == 3) {
              context.read<FavoriteBooksCubit>().fetchFavoriteBooksDB();
              await context.read<SelectCategoryCubit>().addSelectedCategory();

              AppRoutes.goReplace(context, HomeView.nameRoute);
            }
          },
          child: Container(
            height: 35.h,
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            decoration: BoxDecoration(
                color: state.length == 3
                    ? AppColors.darkTab
                    : const Color(0XFFA0A0A0),
                borderRadius: BorderRadius.circular(15)),
            child: Text(
              AppLangKey.finish.tr(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 19.sp,
                fontWeight: FontWeight.w500,
                color:
                    state.length == 3 ? AppColors.bgWhite : AppColors.textColor,
              ),
            ),
          ),
        );
      },
    );
  }
}
