import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_search_dialog.dart';
import 'custom_search_text_field.dart';

class CustomSrhAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomSrhAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 10,
      actions: [
        IconButton(
          onPressed: () => CustomSrhDialog.showCustomDialog(context),
          icon: Icon(Icons.filter_alt, size: 20.r),
        )
      ],
      title: const CustomSearchTextField(),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(AppBar().preferredSize.height * 0.9);
}
