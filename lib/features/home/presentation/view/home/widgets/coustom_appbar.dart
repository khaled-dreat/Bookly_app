import 'package:clean_arch_bookly_app/core/api/api_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../../core/utils/constant/app_images.dart';
import '../../../../../../core/utils/routes/app_routes.dart';
import '../../../../../favorite/presentation/view/favorite_view.dart';
import '../../../../../search/presentation/views/search/search_view.dart';

class CoustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CoustomAppBar({super.key});

  @override
  State<CoustomAppBar> createState() => _CoustomAppBarState();

  @override
  Size get preferredSize =>
      Size.fromHeight(AppBar().preferredSize.height * 0.9);
}

class _CoustomAppBarState extends State<CoustomAppBar> {
  @override
  void initState() {
    super.initState();
    ApiService.checkConnectitivy();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        StreamBuilder<ConnectivityResult>(
            stream: Connectivity().onConnectivityChanged,
            builder: (context, snapshot) {
              return snapshot.data == ConnectivityResult.none
                  ? const Icon(
                      Icons.wifi_off,
                      color: Colors.red,
                    )
                  : const SizedBox();
            }),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            onPressed: () => AppRoutes.go(context, SearchView.nameRoute),
            icon: const Icon(FontAwesomeIcons.magnifyingGlass),
            iconSize: 21.r,
          ),
        ),
      ],
    );
  }
}
