import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:user/core/utils/google_mpas_tools.dart';
import '../../../../core/entities/property.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_values.dart';

class EstateShortDetailsSection extends StatelessWidget {
  final Property property;
  const EstateShortDetailsSection({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    final titleTheme = Theme.of(context).textTheme.titleLarge!.copyWith(
        color: AppColors.blueDarK,
        fontSize: AppValues.font * 28,
        fontWeight: FontWeight.w700);
    final subTitleTheme = Theme.of(context).textTheme.bodySmall!.copyWith(
        color: AppColors.greyMedi,
        fontWeight: FontWeight.w400,
        fontSize: AppValues.font * 16);

    return Column(
      children: [
        SizedBox(
          height: AppValues.sizeHeight * 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(property.title, style: titleTheme),
            Row(
              textDirection: TextDirection.rtl,
              children: [
                Text("\$", style: titleTheme),
                SizedBox(
                  width: AppValues.sizeWidth * 5,
                ),
                Text(property.price.toString(), style: titleTheme),
              ],
            ),
          ],
        ),
        SizedBox(
          height: AppValues.sizeHeight * 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.location_pin,
                  color: AppColors.blueLight,
                  size: AppValues.font * 16,
                ),
                SizedBox(
                  width: AppValues.sizeWidth * 2,
                ),
                FutureBuilder<Placemark>(
                    future: GoogleMapsTools().convertPositionToAddress(
                        lat: property.location[1], lon: property.location[0]),
                    builder: (context, snapshot) {
                      return snapshot.data != null
                          ? Text(snapshot.data!.locality.toString(),
                              style: subTitleTheme)
                          : Text("...", style: subTitleTheme);
                    }),
              ],
            ),
            Row(
              children: [
                Text(property.type, style: subTitleTheme),
                if (property.type.toLowerCase().compareTo("rent") == 0)
                  Text(
                    "/",
                    style: subTitleTheme
                  ),
                if (property.type.toLowerCase().compareTo("rent") == 0)
                  Text(
                    property.rentType!,
                    style: subTitleTheme.copyWith(color: AppColors.black,)
                  ),
              ],
            )
          ],
        ),
        SizedBox(
          height: AppValues.sizeHeight * 20,
        ),
        const Divider(),
      ],
    );
  }
}
