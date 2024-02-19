import 'package:clean_arch_bookly_app/features/drawer/drawer/drawer-header/drawer_header.dart';
import 'package:flutter/material.dart';

import 'drawer-settings/drawer_settings.dart';

class DrawerBody extends StatelessWidget {
  const DrawerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: const [
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
