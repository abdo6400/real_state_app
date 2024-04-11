import 'package:flutter/material.dart';
import 'package:user/config/locale/app_localizations.dart';
import 'package:user/core/utils/app_values.dart';
import '../../../../core/utils/app_colors.dart';

class CustomTopBarSection extends StatelessWidget {
  final String title;
  final String subTitle;
  final Function function;
  final bool addButton;
  const CustomTopBarSection(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.function,
      this.addButton = true});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title.tr(context),
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.w600, color: AppColors.blueDarK,fontSize: AppValues.font*21),
        ),
        (addButton)
            ? GestureDetector(
                onTap: () => function(),
                child: Row(
                  children: [
                    Text(
                      subTitle.tr(context),
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: AppColors.blueLight),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.blueDarK,
                      size: AppValues.font * 20,
                    )
                  ],
                ),
              )
            : const SizedBox()
      ],
    );
  }
}
