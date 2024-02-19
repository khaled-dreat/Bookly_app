import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/images/image_profile.dart';

class CustomImgProfilePage extends StatelessWidget {
  const CustomImgProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomRight, children: [
      // * Image
      SizedBox(height: 140.h, child: const ImageProfile()),
      // * Edite Image Btn
      IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.camera_alt,
            size: 35.sp,
          )),
    ]);
  }
}
