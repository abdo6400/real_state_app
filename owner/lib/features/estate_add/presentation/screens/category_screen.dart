import 'package:flutter/material.dart';
import 'package:owner/config/locale/app_localizations.dart';
import 'package:owner/core/utils/app_values.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../components/category_details_section.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: AppValues.sizeHeight * 12,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: AppStrings.hey.tr(context),
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: AppValues.font * 28, color: AppColors.blueDarK),
                ),
                const TextSpan(text: " "),
                TextSpan(
                  text: AppStrings.fillDetailOfYour.tr(context),
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: AppValues.font * 28, color: AppColors.blueDarK),
                ),
              ],
            ),
          ),
          SizedBox(
            height: AppValues.sizeHeight * 20,
          ),
          Text(
            AppStrings.realEstate.tr(context),
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: AppValues.font * 28,
                  color: AppColors.blueDarK,
                ),
          ),
          SizedBox(
            height: AppValues.sizeHeight * 20,
          ),
          const CategoryDetailsSection(),
        ],
      ),
    );
  }
}
