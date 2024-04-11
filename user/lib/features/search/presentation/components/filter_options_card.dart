import 'package:flutter/material.dart';
import 'package:user/config/locale/app_localizations.dart';
import 'package:user/core/utils/app_values.dart';
import '../../../../core/components/default_components/default_form_field.dart';
import '../../../../core/components/map/presentation/components/location_map_card.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import 'filter_types_section.dart';

class FilterOptionsCard extends StatelessWidget {
  const FilterOptionsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppValues.paddingWidth * 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.filter.tr(context),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: AppValues.font * 24,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blueDarK),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Card(
                    elevation: 0,
                    color: AppColors.blueLight,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(AppValues.radius * 28)),
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppValues.paddingWidth * 35,
                            vertical: AppValues.paddingHeight * 20),
                        child: Text(
                          AppStrings.reset.tr(context),
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w400),
                        )),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: AppValues.sizeHeight * 24,
            ),
            Text(
              AppStrings.propertyType.tr(context),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: AppValues.font * 24,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blueDarK),
            ),
            SizedBox(
              height: AppValues.sizeHeight * 20,
            ),
            const FilterTypesSection(),
            SizedBox(
              height: AppValues.sizeHeight * 20,
            ),
            Text(
              AppStrings.location.tr(context),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: AppValues.font * 24,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blueDarK),
            ),
            SizedBox(
              height: AppValues.sizeHeight * 20,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(AppValues.radius * 12),
              child: DefaultTextFormField(
                  suffix: Icons.search,
                  prefix: Icons.location_pin,
                  onTap: () {},
                  controller: TextEditingController(),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: AppValues.paddingHeight * 28,
                      horizontal: AppValues.paddingWidth * 14),
                  color: AppColors.greySoft1,
                  type: TextInputType.text,
                  hint: AppStrings.locationDetail.tr(context),
                  label: null),
            ),
            SizedBox(
              height: AppValues.sizeHeight * 20,
            ),
            Expanded(
                child: LocationMapCard(
              title: AppStrings.selectOnMap,
              height: double.infinity,
              function: () {},
            )),
          ],
        ),
      ),
    );
  }
}
