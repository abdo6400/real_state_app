import 'package:flutter/material.dart';
import 'package:user/config/locale/app_localizations.dart';
import '../../../../core/entities/property.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_values.dart';

class CostOfLivingSection extends StatelessWidget {
  final Property property;
  const CostOfLivingSection({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.costOfLiving.tr(context),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: AppValues.font * 20,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blueDarK),
            ),
            Text(
              AppStrings.viewDetails.tr(context),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: AppValues.font * 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blueLight),
            ),
          ],
        ),
        SizedBox(
          height: AppValues.sizeHeight * 20,
        ),
        Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
                horizontal: AppValues.paddingWidth * 8,
                vertical: AppValues.paddingHeight * 12),
            decoration: BoxDecoration(
                color: AppColors.greySoft1,
                borderRadius: BorderRadius.circular(AppValues.radius * 28)),
            child: ListTile(
              title: Row(
                children: [
                  Text(
                    "\$",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: AppValues.font * 28,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  SizedBox(
                    width: AppValues.sizeWidth * 8,
                  ),
                  Text(
                    "220",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: AppValues.font * 20,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Text(
                    "/",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: AppValues.font * 20,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Text(
                    AppStrings.month.tr(context),
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: AppValues.font * 14,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
              subtitle: Text(
                "*From average citizen spend around this location",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: AppColors.greyMedi,
                    fontSize: AppValues.font * 12,
                    fontWeight: FontWeight.w400),
              ),
            )),
        SizedBox(
          height: AppValues.sizeHeight * 60,
        ),
      ],
    );
  }
}
