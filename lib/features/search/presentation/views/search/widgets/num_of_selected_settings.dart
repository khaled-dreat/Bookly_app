import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../manger/category_books/category_books_cubit.dart';

class NumOfSelectedSettings extends StatelessWidget {
  const NumOfSelectedSettings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IconButtonCubit, int?>(
      builder: (context, state) {
        return Positioned(
          right: 5,
          bottom: 25,
          child: Container(
            alignment: Alignment.topCenter,
            height: 13.h,
            width: 13.w,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              state.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
        );
      },
    );
  }
}
