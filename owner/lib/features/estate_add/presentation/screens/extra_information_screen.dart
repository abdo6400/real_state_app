import 'package:flutter/material.dart';
import 'package:owner/config/locale/app_localizations.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_values.dart';
import '../components/price_section.dart';
import '../components/property_features_section.dart';
import '../components/total_rooms_section.dart';

class ExtraInformationScreen extends StatelessWidget {
  const ExtraInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: AppValues.sizeHeight * 16,
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: AppStrings.almostFinish.tr(context),
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: AppValues.font * 28, color: AppColors.blueLight),
              ),
              const TextSpan(text: ", "),
              TextSpan(
                text: AppStrings.completeTheListing.tr(context),
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: AppValues.font * 28, color: AppColors.blueDarK),
              ),
            ],
          ),
        ),
        SizedBox(
          height: AppValues.sizeHeight * 20,
        ),

        const PriceSection(),
        SizedBox(
          height: AppValues.sizeHeight * 20,
        ),
        const PropertyFeatureSection(),
        SizedBox(
          height: AppValues.sizeHeight * 20,
        ),
        const TotalRoomsSection(),
        // SizedBox(
        //   height: AppValues.sizeHeight*20,
        // ),
        // const EnvironmentSection()
      ],
    );
  }
}
