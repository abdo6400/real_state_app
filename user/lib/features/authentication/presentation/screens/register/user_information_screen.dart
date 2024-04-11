import 'package:flutter/material.dart';
import 'package:user/config/locale/app_localizations.dart';
import 'package:user/core/utils/app_values.dart';
import '../../../../../core/components/default_components/default_appbar.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../components/register_components/personal_information_section.dart';

class UserInformationScreen extends StatelessWidget {
  const UserInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: const DefaultAppBar(
        addLang: true,
        addLeadingButton: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: AppValues.paddingWidth * 15),
        children: [
          SizedBox(
            height: AppValues.sizeHeight * 28,
          ),
          Text(AppStrings.fillInformation.tr(context),
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.displayLarge),
          SizedBox(
            height: AppValues.sizeHeight * 28,
          ),
          Text(
            AppStrings.editMessage.tr(context),
            textAlign: TextAlign.start,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: AppColors.hintColor),
          ),
          SizedBox(
            height: AppValues.sizeHeight * 60,
          ),
          PersonalInformationSection(
            email: ModalRoute.of(context)?.settings.arguments as String,
          )
        ],
      ),
    ));
  }
}
