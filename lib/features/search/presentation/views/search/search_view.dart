import 'package:flutter/material.dart';
import 'widgets/custom_appbar_srh.dart';
import 'widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  static const String nameRoute = "SearchView";
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomSrhAppBar(),
      body: SafeArea(child: SearchViewBody()),
    );
  }
}
