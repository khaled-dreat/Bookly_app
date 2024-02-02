import 'package:flutter/material.dart';

import 'widgets/custom_search_text_field.dart';
import 'widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  static const String nameRoute = "SearchView";
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomSearchTextField(),
      body: SafeArea(child: SearchViewBody()),
    );
  }
}
