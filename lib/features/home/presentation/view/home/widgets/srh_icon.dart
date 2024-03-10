import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../core/utils/routes/app_routes.dart';
import '../../../../../search/presentation/views/search/search_view.dart';

class SrhIcon extends StatelessWidget {
  const SrhIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
        onPressed: () => AppRoutes.go(context, SearchView.nameRoute),
        icon: const Icon(FontAwesomeIcons.magnifyingGlass),
        iconSize: 21.r,
      ),
    );
  }
}
