import 'package:clean_arch_bookly_app/core/utils/theme/app_color.dart';
import 'package:clean_arch_bookly_app/core/utils/theme/app_theme.dart';
import 'package:clean_arch_bookly_app/core/widgets/images/image_profile.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:svg_flutter/svg_flutter.dart';

import '../../../../core/utils/dime/app_dime.dart';
import '../../../../core/widgets/text_form/text_form_field.dart';

class ProfileView extends StatelessWidget {
  static const String nameRoute = "ProfileView";
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ProfileViewBody(),
    );
  }
}

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  DateTime dateTime = DateTime(3000, 2, 1, 10, 20);
  Country? country;

  @override
  Widget build(BuildContext context) {
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

    void pickCountry() {
      showCountryPicker(
        context: context,
        onSelect: (Country _country) {
          setState(() {
            country = _country;
          });
        },
      );
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          25.verticalSpace,
          Row(
            children: [
              IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close)),
              0.1.sh.horizontalSpace,
              Text(
                "Edit Profile",
                style:
                    AppTheme.h5(context)!.copyWith(fontWeight: FontWeight.bold),
              )
            ],
          ),
          25.verticalSpace,
          Stack(alignment: Alignment.bottomRight, children: [
            SizedBox(height: 140.h, child: const ImageProfile()),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.camera_alt,
                  size: 35.sp,
                )),
          ]),
          50.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.r),
            child: Column(
              children: [
                const CustomTextForm(
                  label: "Full Name",
                  hint: "Khaled Ayech Dreat",
                ),
                20.verticalSpace,
                const CustomTextForm(
                  label: "Email",
                  hint: "Dreatkhaled@gmail.com",
                  keyboardType: TextInputType.emailAddress,
                ),
                20.verticalSpace,
                const CustomTextForm(
                  label: "Pssword",
                  hint: "Your Pssword",
                  isPass: true,
                ),
                20.verticalSpace,
                InkWell(
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
                        Text(
                          "${dateTime.day}-${dateTime.month}-${dateTime.year}",
                          style: AppTheme.h6(context)?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppColors.bgWhite),
                        ),
                        SvgPicture.asset(
                          "assets/svg/expand_down.svg",
                          width: 30.w,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
                20.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  //     crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        pickCountry();
                      },
                      child: Container(
                        padding: EdgeInsets.all(7.r),
                        width: 108.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppDime.lg.r),
                          border: Border.all(
                            color: Colors.white, // لون الحدود
                            width: 2.0, // عرض الحدود
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "${country?.countryCode ?? "--"} +${country?.phoneCode ?? "--"}",
                              style: AppTheme.b1(context),
                            ),
                            const Icon(Icons.arrow_drop_down)
                          ],
                        ),
                      ),
                    ),
                    AppDime.md.w.horizontalSpace,
                    Expanded(
                      child: const CustomTextForm(
                        hint: "phone number",
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                  ],
                ),
                20.verticalSpace,
                CustomBtn(
                  title: "Save changes",
                  height: 55.h,
                  onTap: () {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomBtn extends StatelessWidget {
  const CustomBtn({
    super.key,
    this.height,
    required this.title,
    required this.onTap,
  });

  final double? height;
  final String title;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: AppTheme.isDark(context)
          ? AppColors.splashBtnDark
          : AppColors.splashBtnLight,
      borderRadius: BorderRadius.circular(AppDime.xxl.r),
      child: Container(
        width: AppDime.fullScreen.sw,
        height: height ?? AppDime.heightBtn.h,
        margin: EdgeInsets.symmetric(
          horizontal: AppDime.md.r,
          vertical: AppDime.md.r,
        ),
        padding: EdgeInsets.zero,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(AppDime.xxl.r),
          gradient: LinearGradient(
            colors: AppTheme.isDark(context)
                ? AppColors.btnColorsDark
                : AppColors.btnColorsLight,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          title.toUpperCase(),
          style: AppTheme.h6(context)?.copyWith(color: AppColors.bgWhite),
        ),
      ),
    );
  }
}
