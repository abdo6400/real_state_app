import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user/config/database/cache/cache_consumer.dart';
import 'package:user/config/locale/app_localizations.dart';
import 'package:user/config/routes/app_routes.dart';
import 'package:user/core/utils/app_enums.dart';
import 'package:user/core/utils/app_values.dart';
import 'package:user/core/utils/commons.dart';
import '../../../../app/service_locator.dart';
import '../../../../core/bloc/global_cubit/locale_cubit.dart';
import '../../../../core/components/default_components/default_appbar.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../components/profile_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(
        addLang: false,
        addLeadingButton: false,
        appBarText: AppStrings.settings,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: AppValues.paddingWidth * 15),
        children: [
          ListTile(
            leading: const Icon(
              Icons.settings,
            ),
            title: Text(
              AppStrings.appSettings.tr(context),
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: AppColors.black),
            ),
          ),
          ProfileButton(
            title: AppStrings.changeLang,
            function: () => (AppLocalizations.of(context)!.isEnLocale
                ? context.read<LocaleCubit>().toArabic()
                : context.read<LocaleCubit>().toEnglish()),
            iconData: Icons.language_outlined,
          ),
          Card(
              elevation: 0.5,
              child: SwitchListTile(
                onChanged: (value) {},
                value: true,
                activeColor: AppColors.primary,
                title: Text(
                  AppStrings.notifications.tr(context),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: AppColors.black),
                ),
              )),
          Card(
              elevation: 0.5,
              child: SwitchListTile(
                onChanged: (value) {},
                value: true,
                activeColor: AppColors.primary,
                title: Text(
                  AppStrings.messages.tr(context),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: AppColors.black),
                ),
              )),
          ListTile(
            leading: const Icon(
              Icons.account_circle_outlined,
            ),
            title: Text(
              AppStrings.accountSettings.tr(context),
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: AppColors.black),
            ),
          ),
          ProfileButton(
            title: AppStrings.profile,
            function: () {
              // context.navigateTo(screenRoute: Routes.editProfileRoute);
            },
            iconData: Icons.person_2,
          ),
          ProfileButton(
            title: AppStrings.changePassword,
            function: () =>
                context.navigateTo(screenRoute: Routes.changePasswordRoute),
            iconData: Icons.lock_open_outlined,
          ),
          ProfileButton(
            title: AppStrings.deleteAccount,
            function: () => {},
            iconData: Icons.delete_outline,
          ),
          ProfileButton(
            title: AppStrings.logout,
            function: () async {
              context.navigateAndFinishAll(screenRoute: Routes.loginRoute);
              await sl<CacheConsumer>()
                  .clearValue(key: MySharedKeys.apiToken.name);
            },
            iconData: Icons.logout,
          ),
        ],
      ),
    );
  }
}
