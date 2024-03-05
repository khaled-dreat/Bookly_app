import 'package:clean_arch_bookly_app/core/utils/language/app_lang_key.dart';
import 'package:country_picker/country_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/dime/app_dime.dart';
import '../../../../../core/utils/theme/app_theme.dart';
import '../../../../../core/widgets/text_form/text_form_field.dart';

class PickCountryAndPhoneNum extends StatefulWidget {
  const PickCountryAndPhoneNum({
    super.key,
  });

  @override
  State<PickCountryAndPhoneNum> createState() => _PickCountryAndPhoneNumState();
}

class _PickCountryAndPhoneNumState extends State<PickCountryAndPhoneNum> {
  Country? country;

  void pickCountry() {
    showCountryPicker(
      context: context,
      onSelect: (Country value) {
        setState(() {
          country = value;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
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
                color: Colors.white,
                width: 2.0,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // * Country Code And PhoneCode Text
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
        // * Text Form Phone Number
        Expanded(
          child: CustomTextForm(
            hint: AppLangKey.phoneNumber.tr(),
            keyboardType: TextInputType.phone,
          ),
        ),
      ],
    );
  }
}
