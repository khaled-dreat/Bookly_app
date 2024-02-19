import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../../core/utils/constant/app_images.dart';
import '../../../../../../core/utils/routes/app_routes.dart';
import '../../../../../favorite/presentation/view/favorite_view.dart';
import '../../../../../search/presentation/views/search/search_view.dart';

class CoustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CoustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
          onPressed: () => AppRoutes.go(context, SearchView.nameRoute),
          icon: const Icon(FontAwesomeIcons.magnifyingGlass),
          iconSize: 21.r,
        ),
      ],
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(AppBar().preferredSize.height * 0.9);
}
