import 'package:clean_arch_bookly_app/features/search/presentation/views/search/widgets/num_of_selected_settings.dart';
import 'package:flutter/material.dart';
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
        Stack(children: [
          IconButton(
            onPressed: () => CustomSrhDialog.showCustomDialog(context),
            icon: const Icon(
              Icons.tune_outlined,
            ),
          ),
          const NumOfSelectedSettings(),
        ])
      ],
      title: const CustomSearchTextField(),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(AppBar().preferredSize.height * 0.9);
}
