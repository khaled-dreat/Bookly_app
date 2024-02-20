/*
import 'package:clean_arch_bookly_app/features/auth/sign_in.dart';
import 'package:flutter/material.dart';

import '../../core/widgets/loading/app_loading.dart';

class Wrapper extends StatelessWidget {
  static const String nameRoute = 'Wrapper';
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
   // ControllerAuth pAuth = Provider.of<ControllerAuth>(context, listen: false);
    return Scaffold(
      body: StreamBuilder(
          stream: pAuth.currentUser,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const AppLoading(loading: TypeLoading.page);
            }
            return snapshot.hasData ? const PageHome() : const PageSignIn();
          }),
    );
  }
}
*/