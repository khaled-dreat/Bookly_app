import 'package:flutter/material.dart';

import 'widgets/splach_view_body.dart';

class SplachView extends StatelessWidget {
  static String nameRoute = "SplachView";
  const SplachView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplachViewBody(),
    );
  }
}
