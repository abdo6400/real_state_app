import 'package:flutter/material.dart';
import 'package:owner/config/locale/app_localizations.dart';


import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_values.dart';

class BottomBar extends StatelessWidget {
  final String firstTitle;
  final String secondTitle;
  final Function function;
  const BottomBar(
      {super.key,
      required this.firstTitle,
      required this.secondTitle,
      required this.function});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(
              flex: 1,
              child: Divider(
                color: AppColors.lightGrey,
                thickness: 1.0,
              ),
            ),
            SizedBox(
              width: AppValues.sizeWidth * 12,
            ),
            Text(
              AppStrings.or.tr(context),
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: AppColors.lightGrey),
            ),
            SizedBox(
              width: AppValues.sizeWidth * 12,
            ),
            const Expanded(
              flex: 1,
              child: Divider(
                color: AppColors.lightGrey,
                thickness: 1.0,
              ),
            ),
          ],
        ),
        SizedBox(
          height: AppValues.sizeHeight * 8,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppValues.paddingWidth * 30,
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Flexible(
              fit: FlexFit.tight,
              child: GestureDetector(
                child: Card(
                  elevation: 0,
                  color: AppColors.lightGrey.withOpacity(0.5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                    AppValues.radius * 28,
                  )),
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppValues.paddingWidth * 20,
                          vertical: AppValues.paddingHeight * 12),
                      child: Image.asset(
                        AppImages.googleLogo,
                        height: AppValues.sizeHeight * 40,
                      )),
                ),
              ),
            ),
            SizedBox(
              width: AppValues.sizeWidth * 30,
            ),
            Flexible(
              fit: FlexFit.tight,
              child: GestureDetector(
                child: Card(
                  elevation: 0,
                  color: AppColors.lightGrey.withOpacity(0.5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                    AppValues.radius * 28,
                  )),
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppValues.paddingWidth * 20,
                          vertical: AppValues.paddingHeight * 12),
                      child: Image.asset(
                        AppImages.facebookLogo,
                        height: AppValues.sizeHeight * 40,
                      )),
                ),
              ),
            ),
          ]),
        ),
        SizedBox(
          height: AppValues.sizeHeight * 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(firstTitle.tr(context),
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(fontWeight: FontWeight.bold)),
            TextButton(
              onPressed: () => function(),
              child: Text(secondTitle.tr(context),
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: AppColors.blueLight,
                      )),
            ),
          ],
        ),
      ],
    );
  }
}
