import 'package:flutter/material.dart';
import 'package:user/config/locale/app_localizations.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_values.dart';

class DiscoundCard extends StatelessWidget {
  final String title;
  final String disCount;
  final String imageUrl;
  const DiscoundCard(
      {super.key,
      required this.title,
      required this.disCount,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(AppValues.radius * 28),
        topRight: Radius.circular(AppValues.radius * 28),
        bottomRight: Radius.circular(AppValues.radius * 28),
      ),
      child: Stack(children: [
        Container(
          height: (AppValues.sizeHeight * 230),
          width: (AppValues.sizeWidth * 300),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(imageUrl), fit: BoxFit.fill),
          ),
        ),
        Container(
          height: (AppValues.sizeHeight * 230),
          width: (AppValues.sizeWidth * 300),
          decoration: const BoxDecoration(
            color: Colors.black26,
          ),
        ),
        Positioned(
            bottom: 0,
            left: 0,
            child: GestureDetector(
              onTap: () {},
              child: Card(
                color: AppColors.blueLight,
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(AppValues.radius * 28))),
                elevation: 0,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppValues.paddingWidth * 35,
                      vertical: AppValues.paddingHeight * 16),
                  child: const Icon(
                    Icons.arrow_right_alt_outlined,
                    color: AppColors.white,
                  ),
                ),
              ),
            )),
        Positioned(
            left: AppValues.sizeWidth * 20,
            top: AppValues.sizeHeight * 60,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: AppValues.font * 24,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white),
                ),
                SizedBox(
                  height: AppValues.sizeHeight * 24,
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: AppStrings.allDiscountUpTo.tr(context),
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: AppColors.white, letterSpacing: 0.5),
                  ),
                  const TextSpan(text: "  "),
                  TextSpan(
                    text: disCount,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: AppColors.white, letterSpacing: 0.5),
                  )
                ]))
              ],
            ))
      ]),
    );
  }
}
