import 'package:flutter/material.dart';
import 'widgets/page_selected_lang_view_body.dart';

class PageSelectedLangView extends StatelessWidget {
  static const nameRoute = 'PageSelectedLangView';
  const PageSelectedLangView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PageSelectedLangViewBody(),
    );
  }
}
