import 'package:flutter/material.dart';
import '../../../../../../core/utils/constant/app_images.dart';

class CustomSplachLogo extends StatelessWidget {
  const CustomSplachLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Image(
          fit: BoxFit.fill,
          height: 250,
          image: AssetImage(AppImages.appLogoLight)),
    );
  }
}
