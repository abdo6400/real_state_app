import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owner/core/utils/app_values.dart';

class EstateAppBar extends StatelessWidget {
  const EstateAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.all(AppValues.radius * 8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppValues.radius * 40),
            child: Image.network(
                fit: BoxFit.fill,
                height: ScreenUtil().screenHeight,
                width: ScreenUtil().screenWidth,
                "https://th.bing.com/th/id/OIP.eJaHfZcqERZtebiBgxd70gHaE8?pid=ImgDet&rs=1"),
          ),
        ),
        /*  Positioned(
            bottom: AppValues.s28.h,
            left: AppValues.s20.w,
            child: Row(
              children: [
                Container(
                  height: AppValues.s60.h,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                    horizontal: AppPadding.p20.w,
                  ),
                  decoration: BoxDecoration(
                      color: AppColors.blueLight.withOpacity(0.69),
                      borderRadius: BorderRadius.circular(AppValues.s60.r)),
                  child: Row(
                    children: [
                      DefaultRatingBarIndicator(
                          rating: 1, itemCount: 1, itemSize: AppValues.s24.sp),
                      Text(
                        "4.9",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: AppColors.white, fontSize: AppValues.s18.sp),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: AppValues.s14.w,
                ),
                Container(
                  height: AppValues.s60.h,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                    horizontal: AppPadding.p20.w,
                  ),
                  decoration: BoxDecoration(
                      color: AppColors.blueLight.withOpacity(0.69),
                      borderRadius: BorderRadius.circular(AppValues.s60.r)),
                  child: Text(
                    "Apartment",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColors.white, fontSize: AppValues.s18.sp),
                  ),
                )
              ],
            ))*/
      ],
    );
  }
}
