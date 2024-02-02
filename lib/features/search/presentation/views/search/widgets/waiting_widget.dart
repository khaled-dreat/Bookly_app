import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg_flutter.dart';

class WaitingWidget extends StatelessWidget {
  const WaitingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          height: 400.h,
          width: 350.w,
          child: SvgPicture.asset("assets/svg/undraw_searching_re_3ra9.svg")),
    );
  }
}
