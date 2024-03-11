import 'package:clean_arch_bookly_app/core/utils/language/app_lang_key.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';
import '../../../../../../core/utils/theme/app_theme.dart';

class BookRating extends StatelessWidget {
  const BookRating({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    required this.reating,
  });
  final String reating;
  final MainAxisAlignment mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Icon(
          FontAwesomeIcons.solidStar,
          color: Colors.amber,
          size: 15.r,
        ),
        5.horizontalSpace,
        Text(
          getRandomNumber(),
          style: AppTheme.b2(context),
        ),
      ],
    );
  }
}

class DetailsBookRating extends StatelessWidget {
  const DetailsBookRating({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    required this.reating,
  });
  final String reating;
  final MainAxisAlignment mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Icon(
          FontAwesomeIcons.solidStar,
          color: Colors.amber,
          size: 20.r,
        ),
        5.horizontalSpace,
        Text(
          getRandomNumber(),
          style: AppTheme.h6(context),
        ),
      ],
    );
  }
}

String getRandomNumber() {
  Random random = Random();
  double min = 2.5;
  double max = 5.0;
  double randomNumber = min + random.nextDouble() * (max - min);
  return double.parse(randomNumber.toStringAsFixed(1)).toString();
}
