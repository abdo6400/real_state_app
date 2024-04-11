import 'dart:async';
import 'package:flutter/material.dart';
import 'package:owner/config/locale/app_localizations.dart';
import 'package:owner/core/utils/commons.dart';
import '../../../../app/service_locator.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_images.dart';
import '../../../config/database/cache/cache_consumer.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_strings.dart';
import '../../utils/app_values.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _goNext() async {
    (await sl<CacheConsumer>().getStringData(key: MySharedKeys.apiToken.name) !=
            null)
        ? context.navigateAndFinish(screenRoute: Routes.mainRoute)
        : context.navigateAndFinish(screenRoute: Routes.loginRoute);
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 3000), () => _goNext());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
                fit: BoxFit.fill,
                height: AppValues.screenHeight,
                width: AppValues.screenWidth,
                AppImages.splashOnboardingBackground),
            Container(
                height: AppValues.screenHeight,
                width: AppValues.screenWidth,
                color: Colors.black26),
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                AppImages.appLogo,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: AppValues.sizeHeight * 40),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      AppStrings.appName.tr(context).toUpperCase(),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                          wordSpacing: AppValues.sizeWidth * 2,
                          letterSpacing: AppValues.sizeWidth * 4),
                    ),
                    SizedBox(height: AppValues.sizeHeight*5,),
                    Text(
                      AppStrings.owner.tr(context).toUpperCase(),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                          wordSpacing: AppValues.sizeWidth * 2,
                          letterSpacing: AppValues.sizeWidth * 4),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
