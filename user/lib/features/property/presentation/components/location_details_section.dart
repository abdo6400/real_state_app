import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:user/config/locale/app_localizations.dart';
import '../../../../core/entities/property.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_values.dart';
import '../../../../core/utils/google_mpas_tools.dart';

class LocationDetailsSection extends StatelessWidget {
  final Property property;
  const LocationDetailsSection({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppValues.paddingWidth * 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.locationAndpublicFacilities.tr(context),
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: AppValues.font * 20,
                fontWeight: FontWeight.w600,
                color: AppColors.blueDarK),
          ),
          SizedBox(
            height: AppValues.sizeHeight * 20,
          ),
          Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(AppValues.radius * 20)),
              child: Row(
                children: [
                  CircleAvatar(
                      radius: (AppValues.radius * 28),
                      backgroundColor: AppColors.greySoft1,
                      child: const Icon(
                        Icons.location_on_outlined,
                        color: AppColors.blueDarK,
                      )),
                  SizedBox(
                    width: AppValues.sizeWidth * 12,
                  ),
                  FutureBuilder<Placemark>(
                      future: GoogleMapsTools().convertPositionToAddress(
                          lat: property.location[1], lon: property.location[0]),
                      builder: (context, snapshot) {
                        return snapshot.data != null
                            ? Text(
                                snapshot.data!.locality.toString(),
                                maxLines: 2,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        color: AppColors.greyMedi,
                                        fontSize: AppValues.font * 14,
                                        height: AppValues.sizeHeight * 2,
                                        fontWeight: FontWeight.w400),
                              )
                            : Text("...");
                      }),
                ],
              )),
          SizedBox(
            height: AppValues.sizeHeight * 20,
          ),
          Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                  horizontal: AppValues.paddingWidth * 14,
                  vertical: AppValues.paddingHeight * 16),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border.all(color: AppColors.greySoft2),
                  borderRadius: BorderRadius.circular(AppValues.radius * 20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.location_pin,
                        color: AppColors.blueDarK,
                      ),
                      SizedBox(
                        width: AppValues.sizeWidth * 12,
                      ),
                      Text(
                        "2.5 km ",
                        maxLines: 2,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: AppColors.blueDarK,
                            fontSize: AppValues.font * 14,
                            height: AppValues.sizeHeight * 2,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: AppValues.sizeWidth * 2,
                      ),
                      Text(
                        "from your location",
                        maxLines: 2,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: AppColors.greyMedi,
                            fontSize: AppValues.font * 14,
                            height: AppValues.sizeHeight * 2,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.arrow_drop_down_outlined,
                    color: AppColors.blueLight,
                  )
                ],
              )),
          SizedBox(
            height: AppValues.sizeHeight * 20,
          ),
          SizedBox(
            height: AppValues.sizeHeight * 70,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Card(
                      elevation: 0,
                      color: AppColors.greySoft1,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(AppValues.radius * 28)),
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppValues.paddingWidth * 28,
                              vertical: AppValues.paddingHeight * 18),
                          child: Text(
                            property.facilities[index],
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    fontSize: AppValues.font * 16,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.blueDarK),
                          )));
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: AppValues.sizeWidth * 12,
                  );
                },
                itemCount: property.facilities.length),
          ),
          SizedBox(
            height: AppValues.sizeHeight * 20,
          ),
        ],
      ),
    );
  }
}
