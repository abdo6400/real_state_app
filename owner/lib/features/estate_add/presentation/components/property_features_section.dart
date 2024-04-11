import 'package:flutter/material.dart';
import 'package:owner/config/locale/app_localizations.dart';
import 'package:owner/core/utils/app_values.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';

import 'feature_card.dart';

class PropertyFeatureSection extends StatelessWidget {
  const PropertyFeatureSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: AppValues.sizeHeight * 14,
        ),
        Text(
          AppStrings.propertyFeatures.tr(context),
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: AppValues.font * 28, color: AppColors.blueDarK),
        ),
        SizedBox(
          height: AppValues.sizeHeight * 14,
        ),
        const FeatureCard(nameOfFeature: 'Bed', type: 1),
        SizedBox(
          height: AppValues.sizeHeight * 14,
        ),
        const FeatureCard(nameOfFeature: 'Bathrooms', type: 2),
        SizedBox(
          height: AppValues.sizeHeight * 14,
        ),
        const FeatureCard(nameOfFeature: 'Balcony', type: 3),
      ],
    );
  }
}
