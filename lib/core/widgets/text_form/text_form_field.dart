import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/dime/app_dime.dart';
import '../../utils/theme/app_color.dart';
import '../../utils/theme/app_theme.dart';

class CustomTextForm extends StatefulWidget {
  const CustomTextForm({
    super.key,
    this.initValue,
    this.keyboardType,
    this.isPass = false,
    this.validator,
    this.onSaved,
    this.onChanged,
    // * Decoration
    this.hint,
    this.label,
    this.help,
    this.preIcon,
    this.postIcon,
  });
  final String? initValue;
  final TextInputType? keyboardType;
  final bool isPass;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  // * Decoration
  final String? hint;
  final String? label;
  final String? help;
  final IconData? preIcon;
  final IconData? postIcon;

  @override
  State<CustomTextForm> createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // ControllerAuth pAuth = Provider.of<ControllerAuth>(context);

    return TextFormField(
      focusNode: focusNode,
      initialValue: widget.initValue,
      keyboardType: widget.keyboardType,
      cursorColor: AppColors.bgWhite,
      obscureText: widget.isPass,
      obscuringCharacter: '✵',
      textCapitalization: TextCapitalization.none,
      validator: widget.validator,
      onSaved: widget.onSaved,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        hintText: widget.hint,
        labelText: widget.label,
        labelStyle: styleLabel(context),
        border: InputBorder.none,
        helperText: widget.help,
        helperMaxLines: 2,
        prefixIcon: widget.preIcon != null
            ? Icon(
                widget.preIcon,
                //  color: focusNode.hasFocus
                //      ? AppTheme.iconColorTheme(context)
                //      : AppColors.bgGrey,
              )
            : null,
        suffixIcon: widget.postIcon != null
            ? IconButton(
                onPressed: () {},
                icon: Icon(
                  widget.postIcon,
                  //   color: AppTheme.iconColorTheme(context),
                ),
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDime.lg.r),
          borderSide: BorderSide(color: AppColors.bgWhite, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDime.lg.r),
          borderSide: BorderSide(color: AppColors.bgWhite, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDime.lg.r),
          borderSide: BorderSide(color: AppColors.bgWhite, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDime.lg.r),
          borderSide: BorderSide(color: AppColors.bgWhite, width: 2),
        ),
      ),
    );
  }

  TextStyle? styleLabel(BuildContext context) {
    return AppTheme.h6(context)
        ?.copyWith(fontWeight: FontWeight.w700, color: AppColors.bgWhite);
  }
/*
  TextStyle? styleLabel(BuildContext context) {
    return AppTheme.h6(context)?.copyWith(
        fontWeight: FontWeight.w700,
        color:
            AppTheme.isDark(context) ? AppColors.bgWhite : AppColors.bgBlack);
  }*/
}
