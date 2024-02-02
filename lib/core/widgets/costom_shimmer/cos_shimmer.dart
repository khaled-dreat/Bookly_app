import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CostomShimmer extends StatelessWidget {
  final double width, height;
  const CostomShimmer({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      width: width.w,
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.3),
          borderRadius: BorderRadius.all(Radius.circular(14.r))),
    );
  }
}
