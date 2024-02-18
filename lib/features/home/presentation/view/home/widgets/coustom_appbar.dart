import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../../core/utils/constant/app_images.dart';
import '../../../../../../core/utils/routes/app_routes.dart';
import '../../../../../favorite/presentation/view/favorite_view.dart';
import '../../../../../search/presentation/views/search/search_view.dart';

class CoustomAppBar extends StatelessWidget {
  const CoustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 45.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            AppImages.appLogoLight,
            height: 25.h,
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    AppRoutes.go(context, FavoriteView.nameRoute);
                  },
                  icon: const Icon(Icons.favorite_border)),
              IconButton(
                onPressed: () => AppRoutes.go(context, SearchView.nameRoute),
                icon: const Icon(FontAwesomeIcons.magnifyingGlass),
                iconSize: 21.r,
              ),
            ],
          )
        ],
      ),
    );
  }
}
