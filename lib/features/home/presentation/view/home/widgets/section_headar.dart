import 'package:flutter/material.dart';

import '../../../../../../core/utils/theme/app_theme.dart';

class SectionHeadar extends StatelessWidget {
  const SectionHeadar({
    Key? key,
    required this.title,
    this.onPressed,
  }) : super(key: key);

  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTheme.h5(context),
        ),
        IconButton(
            onPressed: onPressed,
            icon: const Icon(Icons.keyboard_double_arrow_right_outlined))
      ],
    );
  }
}
