import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg_flutter.dart';

import '../../../../../core/utils/dime/app_dime.dart';
import '../../../../../core/utils/theme/app_color.dart';
import '../../../../../core/utils/theme/app_theme.dart';

class DatePickerDOB extends StatefulWidget {
  const DatePickerDOB({
    super.key,
  });

  @override
  State<DatePickerDOB> createState() => _DatePickerDOBState();
}

class _DatePickerDOBState extends State<DatePickerDOB> {
  DateTime dateTime = DateTime(
    1980,
    1,
    1,
  );

  Future<void> selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialEntryMode: DatePickerEntryMode.inputOnly,
        firstDate: DateTime(1924),
        lastDate: DateTime(2005));

    if (picked != null) {
      setState(() {
        dateTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectDate();
      },
      child: Container(
        padding: EdgeInsets.all(8.r),
        width: 1.sw,
        height: 50.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDime.lg.r),
          border: Border.all(color: AppColors.bgWhite, width: 2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // * Date Text
            Text(
              "${dateTime.day}-${dateTime.month}-${dateTime.year}",
              style: AppTheme.h6(context)?.copyWith(
                  fontWeight: FontWeight.w700, color: AppColors.bgWhite),
            ),
            // * Icon Expand Down
            SvgPicture.asset(
              "assets/svg/expand_down.svg",
              width: 30.w,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
