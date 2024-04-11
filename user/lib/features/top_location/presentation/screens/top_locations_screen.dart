import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user/config/locale/app_localizations.dart';
import 'package:user/core/components/app_components/products__views/product_vertical_card.dart';
import 'package:user/core/components/default_components/default_appbar.dart';
import 'package:user/core/utils/app_values.dart';
import '../../../../core/entities/property.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';

class TopLocationsScreen extends StatelessWidget {
  const TopLocationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Property> properties =
        ModalRoute.of(context)?.settings.arguments as List<Property>;
    return SafeArea(
      child: Scaffold(
          appBar: const DefaultAppBar(addLang: false, addLeadingButton: true),
          body: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: (AppValues.paddingWidth * 20)),
            child: Column(children: [
              SizedBox(
                width: ScreenUtil().screenWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: AppValues.sizeHeight * 28,
                    ),
                    Text(
                      AppStrings.topLocations.tr(context),
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: AppValues.font * 28,
                          color: AppColors.blueDarK,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: AppValues.sizeHeight * 20,
                    ),
                    Text(
                      AppStrings.findBestRecommendationsPlaceToLive.tr(context),
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: AppColors.blueDarK,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: AppValues.sizeHeight * 20,
                    ),
                    GridView.builder(
                        itemCount: properties.length,
                        padding: EdgeInsets.only(
                            bottom: AppValues.paddingHeight * 50),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: (AppValues.sizeHeight * 280),
                            crossAxisSpacing: AppValues.sizeWidth * 12,
                            mainAxisSpacing: AppValues.sizeHeight * 12,
                            crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return ProductVerticalCard(
                            item: properties[index],
                          );
                        })
                  ],
                ),
              ),
            ]),
          )),
    );
  }
}
