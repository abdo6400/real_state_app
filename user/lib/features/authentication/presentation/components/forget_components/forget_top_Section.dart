import 'package:flutter/material.dart';
import 'package:user/config/locale/app_localizations.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_values.dart';

class ForgetTopSection extends StatelessWidget {
  final String eamil;
  const ForgetTopSection({super.key, required this.eamil});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: AppValues.sizeHeight * 28,
          ),
          Text(
            AppStrings.forgetPassword.tr(context),
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: AppValues.font * 28, color: AppColors.white),
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
            height: AppValues.sizeHeight * 12,
          ),
          Text(
            eamil,
            textAlign: TextAlign.start,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: AppColors.blueLight),
          ),
        ]);
  }
}
