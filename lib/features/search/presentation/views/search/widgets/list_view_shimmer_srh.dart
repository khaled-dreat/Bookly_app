import 'package:clean_arch_bookly_app/core/widgets/costom_shimmer/cos_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ListViewShimmerSrh extends StatelessWidget {
  const ListViewShimmerSrh({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade500,
      highlightColor: Colors.white,
      child: ListView.separated(
        itemCount: 4,
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 14.r,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 150.h,
            child: Row(children: [
              const CostomShimmer(height: 170, width: 120),
              10.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  30.verticalSpace,
                  const CostomShimmer(height: 15, width: 190),
                  20.verticalSpace,
                  const CostomShimmer(height: 15, width: 120),
                  20.verticalSpace,
                  Row(
                    children: [
                      const CostomShimmer(height: 15, width: 110),
                      5.horizontalSpace,
                      const CostomShimmer(height: 15, width: 70),
                    ],
                  )
                ],
              )
            ]),
          );
        },
      ),
    );
  }
}
