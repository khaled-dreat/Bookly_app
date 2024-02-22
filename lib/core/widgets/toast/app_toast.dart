import 'package:clean_arch_bookly_app/core/utils/dime/app_dime.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppToast {
  static toast(String msg, {Color color = Colors.red}) {
    return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: AppDime.lg.sp,
    );
  }
}
