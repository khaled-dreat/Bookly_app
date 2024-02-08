import '../../../../../../core/widgets/costom_shimmer/cos_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class BookDetailsShimmer extends StatelessWidget {
  const BookDetailsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.r),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade500,
        highlightColor: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CostomShimmer(height: 230, width: 200),
                    30.verticalSpace,
                    const CostomShimmer(height: 15, width: 250),
                    10.verticalSpace,
                    const CostomShimmer(height: 15, width: 100),
                    10.verticalSpace,
                    const CostomShimmer(height: 15, width: 230),
                    15.verticalSpace,
                    const CostomShimmer(height: 40, width: 300),
                  ]),
            ),
            SizedBox(
              height: 150.r,
              child: Center(
                  child: ListView.separated(
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: 14.r,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return const CostomShimmer(
                    height: 130,
                    width: 120,
                  );
                },
              )),
            ),
          ],
        ),
      ),
    );
  }
}
