import 'package:clean_arch_bookly_app/features/drawer/presentation/view/widgets/drawer-header/drawer_header.dart';
import 'package:flutter/material.dart';

import 'widgets/drawer-settings/drawer_settings.dart';

class DrawerBody extends StatelessWidget {
  const DrawerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: Column(
        children: [
          // * Header
          DrawerHeade(),
          // * Line
          Divider(thickness: 2),
          // * Setting
          DrawerSettings(),
        ],
      ),
    );
  }
}
