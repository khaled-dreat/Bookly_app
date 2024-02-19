import 'package:flutter/material.dart';
import 'widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  static const String nameRoute = "ProfileView";
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // * Profile View Body
      body: ProfileViewBody(),
    );
  }
}
