import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

class DrawerSettingDesign extends StatelessWidget {
  const DrawerSettingDesign({
    super.key,
    required this.title,
    required this.icon,
    this.trailing,
    this.onTap,
  });
  final String title;
  final SvgPicture icon;
  final Widget? trailing;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: icon,
      trailing: trailing,
      onTap: onTap,
    );
  }
}
