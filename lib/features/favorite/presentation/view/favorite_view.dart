import 'package:clean_arch_bookly_app/core/utils/language/app_lang_key.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'widgets/favorit_view_body.dart';

class FavoriteView extends StatelessWidget {
  static const String nameRoute = "FavoriteView";
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLangKey.favorite.tr())),
      body: const FavoritViewBody(),
    );
  }
}
