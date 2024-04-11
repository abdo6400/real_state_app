import 'package:flutter/material.dart';
import 'package:owner/config/locale/app_localizations.dart';
import 'package:owner/core/utils/app_values.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../components/location_section.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: AppValues.sizeHeight * 20,
        ),
        RichText(
            text: TextSpan(children: [
          TextSpan(
            text: AppStrings.whereIsThe.tr(context),
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: AppValues.font * 28, color: AppColors.blueDarK),
          ),
          TextSpan(
            text: " ",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: AppValues.font * 28, color: AppColors.blueDarK),
          ),
          TextSpan(
            text: AppStrings.location.tr(context),
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: AppValues.font * 28, color: AppColors.blueLight),
          ),
        ])),
        SizedBox(
          height: AppValues.sizeHeight * 20,
        ),
        const LocationSection()
      ],
    );
  }
}
