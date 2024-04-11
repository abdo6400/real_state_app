import 'package:flutter/material.dart';
import 'package:owner/config/locale/app_localizations.dart';
import 'package:owner/core/utils/app_values.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../components/add_image_section.dart';


class PhotoScreen extends StatelessWidget {
  const PhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: AppValues.sizeHeight*20,
        ),
        Text(
          AppStrings.addPhotosToYourListing.tr(context),
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontSize: AppValues.font*28, color: AppColors.blueDarK),
        ),
        SizedBox(
          height: AppValues.sizeHeight*20,
        ),
        const AddImageSection()
      ],
    );
  }
}
