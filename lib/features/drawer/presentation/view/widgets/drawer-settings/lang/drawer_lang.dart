import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/utils/dime/app_dime.dart';
import '../../../../manger/lang/lang_cubit.dart';

class DrawerLang extends StatefulWidget {
  const DrawerLang({super.key});

  @override
  State<DrawerLang> createState() => _DrawerLangState();
}

class _DrawerLangState extends State<DrawerLang> {
  ChoiceLang? choice;

  @override
  void initState() {
    super.initState();
    // * check lang before build UI
    Future.delayed(Duration.zero, () {
      context.read<LangCubit>().checkLang(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    // * Provider Lang
    final LangCubit cLang = context.read<LangCubit>();

    return BlocBuilder<LangCubit, ChoiceLang>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.all(AppDime.md.r),
          child: DropdownButton<ChoiceLang>(
            value: state,
            items: [
              DropdownMenuItem(
                  value: ChoiceLang.en,
                  child: Text(ChoiceLang.en.nameLang.tr())),
              DropdownMenuItem(
                  value: ChoiceLang.ar,
                  child: Text(ChoiceLang.ar.nameLang.tr())),
            ],
            onChanged: (value) {
              log('lang : $value', name: 'DrawerLang');
              cLang.changeLang(context, lang: value ?? ChoiceLang.en);
            },
          ),
        );
      },
    );
  }
}
