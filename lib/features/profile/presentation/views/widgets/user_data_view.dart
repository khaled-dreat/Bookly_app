import 'package:clean_arch_bookly_app/core/utils/language/app_lang_key.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/text_form/text_form_field.dart';
import 'custom_btn.dart';
import 'date_picker_dob.dart';
import 'pick_country_and_phone_num.dart';

class UserDataView extends StatelessWidget {
  const UserDataView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.r),
      child: Column(
        children: [
          // * Fill Name Text Form
          CustomTextForm(
            label: AppLangKey.fullName.tr(),
            //   hint: "Khaled Ayech Dreat",
          ),
          20.verticalSpace,
          // * Email Text Form
          CustomTextForm(
            label: AppLangKey.email.tr(),
            //    hint: "Dreatkhaled@gmail.com",
            keyboardType: TextInputType.emailAddress,
          ),
          20.verticalSpace,
          // * Password Text Form
          CustomTextForm(
            label: AppLangKey.pass.tr(),
            hint: AppLangKey.yourPssword.tr(),
            isPass: true,
          ),
          20.verticalSpace,
          // * Date Picker Date OF Bairth
          const DatePickerDOB(),
          20.verticalSpace,
          // * Picker For Country And Phone Number
          const PickCountryAndPhoneNum(),
          20.verticalSpace,
          // * Save Changes Btn
          CustomBtn(
            title: AppLangKey.saveChanges.tr(),
            height: 55.h,
            onTap: () {},
          )
        ],
      ),
    );
  }
}
