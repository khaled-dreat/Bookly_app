import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/dime/app_dime.dart';
import '../../../../../../core/utils/theme/app_theme.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            "Khaled Deat",
            style: AppTheme.h6(context),
          ),
          // * sizedBox height 8dp
          AppDime.md.verticalSpace,
          // * Email
          Directionality(
            textDirection: TextDirection.ltr,
            child: Text(
              'dreatkhaled@gmail.com',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTheme.b2(context),
            ),
          ),
        ],
      ),
    );
  }
}
