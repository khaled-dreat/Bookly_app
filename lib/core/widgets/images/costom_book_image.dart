import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CostomBookImage extends StatelessWidget {
  const CostomBookImage(
      {super.key,
      required this.image,
      required this.height,
      required this.width});
  final String image;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 8.r),
      child: Container(
          height: height.h,
          width: width.w,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(15.r)),
          ),
          child: CachedNetworkImage(imageUrl: image, fit: BoxFit.fill)),
    );
  }
}
