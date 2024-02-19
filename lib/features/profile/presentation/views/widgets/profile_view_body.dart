import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_img_profile_page.dart';
import 'custome_appbar_profile_page.dart';
import 'user_data_view.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          25.verticalSpace,
          // * app bar
          const CustomeAppbarProfilePage(),
          25.verticalSpace,
          // * Custom Image Profile
          const CustomImgProfilePage(),
          50.verticalSpace,
          // * User Data
          const UserDataView()
        ],
      ),
    );
  }
}
