import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/theme/app_theme.dart';
import 'category_section_srh.dart';
import 'custom_btn_dialog.dart';
import 'searchby_section_srh.dart';

class CustomSrhDialog {
  static void showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: SizedBox(
          width: 250.w,
          height: 360.h,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  "Custom search",
                  style: AppTheme.h6(context),
                ),
                const Divider(height: 15, thickness: 3),
                SizedBox(
                  height: 270.h,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Center(
                        child: Text(
                          "Search By",
                          style: AppTheme.s1(context),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 45.0),
                        child: Divider(
                          indent: 40,
                        ),
                      ),
                      // * Search By Section
                      const SearchBySectionSrh(),
                      // * Category Section
                      const CategorySectionSrh(),
                    ],
                  ),
                ),
                // * Custom Btn Dialog
                const CustomBtnDialog()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
