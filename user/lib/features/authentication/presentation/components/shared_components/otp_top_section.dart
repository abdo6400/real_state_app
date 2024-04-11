import 'package:flutter/material.dart';
import '../../../../../config/locale/app_localizations.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_values.dart';

class OtpTopSection extends StatelessWidget {
  final String email;
  const OtpTopSection({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.enterTheCode.tr(context),
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.titleLarge!
        ),
        SizedBox(
          height: AppValues.sizeHeight * 12,
        ),
        Container(
          width: AppLocalizations.of(context)!.isEnLocale
              ? AppValues.sizeWidth * 40
              : AppValues.sizeWidth * 80,
          height: AppValues.sizeHeight * 4,
          color: AppColors.primary,
        ),
        SizedBox(
          height: AppValues.sizeHeight * 28,
        ),
        Text(
          AppStrings.emailCodeMessage.tr(context),
          textAlign: TextAlign.start,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: AppColors.hintColor),
        ),
        SizedBox(
          height: AppValues.sizeHeight * 40,
        ),
        Text(
          email,
          textAlign: TextAlign.start,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: AppColors.primary),
        ),
      ],
    );
  }
}
