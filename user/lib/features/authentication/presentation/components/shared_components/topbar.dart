import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user/config/locale/app_localizations.dart';
import 'package:user/core/utils/app_values.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_strings.dart';

class TopBar extends StatelessWidget {
  final String title;
  final String subTitle;
  const TopBar({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleAppWidget(),
        SizedBox(
          width: ScreenUtil().screenWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title.tr(context),
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.displayLarge),
              SizedBox(
                height: AppValues.sizeHeight * 12,
              ),
              Text(
                subTitle.tr(context),
                textAlign: TextAlign.start,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: AppColors.hintColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TitleAppWidget extends StatelessWidget {
  const TitleAppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppValues.paddingWidth * 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        textDirection: TextDirection.ltr,
        children: [
          Image.asset(
            AppImages.appLogo,
            height: AppValues.sizeHeight * 100,
          ),
          RichText(
              text: TextSpan(children: [
            TextSpan(
              text: AppStrings.appName.tr(context).split("&")[0],
              style: Theme.of(context).textTheme.displayLarge!,
            ),
            TextSpan(
              text: "&",
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: AppColors.primary),
            ),
            TextSpan(
              text: AppStrings.appName.tr(context).split("&")[1],
              style: Theme.of(context).textTheme.displayLarge!,
            ),
          ])),
        ],
      ),
    );
  }
}
