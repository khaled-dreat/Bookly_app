import 'package:flutter/material.dart';
import 'widgets/wrapper_view_body.dart';

class WrapperView extends StatelessWidget {
  static const String nameRoute = 'Wrapper';
  const WrapperView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WrapperViewBody(),
    );
  }
}
