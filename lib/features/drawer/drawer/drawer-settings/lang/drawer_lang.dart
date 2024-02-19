
import 'package:flutter/material.dart';
/*
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
      // * Provider Lang
      final ControllerLang pLang =
          Provider.of<ControllerLang>(context, listen: false);
      pLang.checkLang(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    // * Provider Lang
    final ControllerLang pLang = Provider.of<ControllerLang>(context);
    return Padding(
      padding: EdgeInsets.all(AppDime.md.r),
      child: DropdownButton<ChoiceLang>(
        value: pLang.lang,
        items: [
          DropdownMenuItem(
              value: ChoiceLang.en, child: Text(ChoiceLang.en.nameLang.tr())),
          DropdownMenuItem(
              value: ChoiceLang.ar, child: Text(ChoiceLang.ar.nameLang.tr())),
        ],
        onChanged: (value) {
          dev.log('lang : $value', name: 'DrawerLang');
          pLang.changeLang(context, lang: value ?? ChoiceLang.en);
        },
      ),
    );
  }
}
*/