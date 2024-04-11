import 'package:flutter/material.dart';
import 'package:user/config/locale/app_localizations.dart';
import '../../../../core/entities/property.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_values.dart';

class ReviewsSection extends StatelessWidget {
  final Property property;
  const ReviewsSection({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.reviews.tr(context),
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: AppValues.font * 20,
              fontWeight: FontWeight.w600,
              color: AppColors.blueDarK),
        ),
        SizedBox(
          height: AppValues.sizeHeight * 10,
        ),
        Container(
          height: (AppValues.sizeHeight * 60),
          alignment: Alignment.center,
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColors.greySoft1,
              borderRadius: BorderRadius.circular(
                AppValues.radius * 12,
              )),
          child: Text(
            AppStrings.viewAllReviews.tr(context),
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: AppColors.blueLight),
          ),
        ),
        SizedBox(
          height: AppValues.sizeHeight * 150,
        ),
      ],
    );
  }
}
