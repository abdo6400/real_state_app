import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user/core/components/default_components/default_appbar.dart';
import '../../../../config/database/api/end_points.dart';
import '../../../../core/components/default_components/default_rating_bar_indicator.dart';
import '../../../../core/entities/property.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_values.dart';

class EstateAppBar extends StatelessWidget {
  final Property property;
  const EstateAppBar({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
            padding: EdgeInsets.all(AppValues.radius * 8),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(AppValues.radius * 30),
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return Image.network(
                        fit: BoxFit.fill,
                        height: ScreenUtil().screenHeight,
                        width: ScreenUtil().screenWidth,
                        EndPoints.images + property.propertyImages[index]);
                  },
                  autoplay: true,
                  itemCount: property.propertyImages.length,
                 // pagination: const SwiperPagination(),
                  control: const SwiperControl(color: AppColors.primary),
                ))),
        Positioned(
          top: AppValues.sizeHeight * 8,
          right: 0,
          left: 0,
          child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: AppValues.paddingWidth * 20),
              child: Row(
                children: [
                  const Expanded(
                      child: DefaultAppBar(
                          addLang: false, addLeadingButton: true)),
                  SizedBox(
                    width: AppValues.sizeWidth * 12,
                  ),
                  /*  Padding(
                      padding:
                          EdgeInsets.only(top: AppValues.paddingHeight * 20),
                      child: GestureDetector(
                        onTap: () => {},
                        child: CircleAvatar(
                            radius: (AppValues.radius * 28),
                            backgroundColor: AppColors.greySoft1,
                            child: Icon(
                              Icons.share,
                              size: AppValues.font * 24,
                              color: AppColors.green,
                            )),
                      ))*/
                ],
              )),
        ),
        Positioned(
            bottom: AppValues.sizeHeight * 28,
            left: AppValues.sizeWidth * 20,
            child: Row(
              children: [
                Container(
                  height: AppValues.sizeHeight * 60,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                    horizontal: AppValues.paddingWidth * 20,
                  ),
                  decoration: BoxDecoration(
                      color: AppColors.blueLight.withOpacity(0.69),
                      borderRadius:
                          BorderRadius.circular(AppValues.radius * 60)),
                  child: Row(
                    children: [
                      DefaultRatingBarIndicator(
                          rating: 1,
                          itemCount: 1,
                          itemSize: AppValues.font * 28),
                      Text(
                        property.ratingsAvg.toString(),
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: AppColors.white,
                            fontSize: AppValues.font * 18),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: AppValues.sizeWidth * 16,
                ),
              ],
            ))
      ],
    );
  }
}
