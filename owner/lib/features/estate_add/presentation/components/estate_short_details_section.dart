import 'package:flutter/material.dart';
import 'package:owner/config/locale/app_localizations.dart';
import 'package:owner/core/utils/app_values.dart';
import '../../../../core/components/default_components/default_button.dart';
import '../../../../core/components/default_components/default_rating_bar_indicator.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_colors.dart';

class EstateShortDetailsSection extends StatelessWidget {
  const EstateShortDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final titleTheme = Theme.of(context).textTheme.titleLarge!.copyWith(
        color: AppColors.blueDarK,
        fontSize: AppValues.font * 28,
        fontWeight: FontWeight.w700);
    final subTitleTheme = Theme.of(context).textTheme.bodySmall!.copyWith(
        color: AppColors.greyMedi,
        fontWeight: FontWeight.w400,
        fontSize: AppValues.font * 14);

    return Column(
      children: [
        SizedBox(
          height: AppValues.sizeHeight * 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Wings Tower", style: titleTheme),
            Row(
              children: [
                Text("\$", style: titleTheme),
                SizedBox(
                  width: AppValues.sizeWidth * 12,
                ),
                Text("220", style: titleTheme),
              ],
            ),
          ],
        ),
        SizedBox(
          height: AppValues.sizeHeight * 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.location_pin,
                  color: AppColors.blueLight,
                  size: AppValues.font * 16,
                ),
                SizedBox(
                  width: AppValues.sizeWidth * 2,
                ),
                Text("Jakarta, Indonesia", style: subTitleTheme),
              ],
            ),
            Text(AppStrings.perMonth.tr(context), style: subTitleTheme),
          ],
        ),
        SizedBox(
          height: AppValues.sizeHeight * 4,
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: AppValues.paddingWidth * 40),
          child: const Divider(
            thickness: 2,
            color: AppColors.blueDarK,
          ),
        ),
        Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
                horizontal: AppValues.paddingWidth * 8,
                vertical: AppValues.paddingHeight * 8),
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(AppValues.radius * 28)),
            child: ListTile(
              trailing: SizedBox(
                width: AppValues.sizeWidth * 100,
                child: Stack(
                  alignment: AlignmentDirectional.centerStart,
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                        right: 0,
                        child: CircleAvatar(
                          backgroundColor: AppColors.white,
                          radius: (AppValues.radius * 28),
                          child: Padding(
                            padding: EdgeInsets.all((AppValues.radius * 4)),
                            child: CircleAvatar(
                              radius: (AppValues.radius * 60),
                              backgroundImage: NetworkImage(
                                  "https://th.bing.com/th/id/OIP.jryuUgIHWL-1FVD2ww8oWgHaHa?rs=1&pid=ImgDetMain"),
                            ),
                          ),
                        )),
                    Positioned(
                        right: (AppValues.sizeWidth * 30),
                        child: CircleAvatar(
                          backgroundColor: AppColors.white,
                          radius: (AppValues.radius * 28),
                          child: Padding(
                            padding: EdgeInsets.all((AppValues.radius * 4)),
                            child: CircleAvatar(
                              radius: (AppValues.radius * 60),
                              backgroundImage: NetworkImage(
                                  "https://th.bing.com/th/id/OIP.jryuUgIHWL-1FVD2ww8oWgHaHa?rs=1&pid=ImgDetMain"),
                            ),
                          ),
                        )),
                    Positioned(
                        right: (AppValues.sizeWidth * 70),
                        child: CircleAvatar(
                          backgroundColor: AppColors.white,
                          radius: (AppValues.radius * 28),
                          child: Padding(
                            padding: EdgeInsets.all((AppValues.radius * 4)),
                            child: CircleAvatar(
                              radius: (AppValues.radius * 60),
                              backgroundImage: NetworkImage(
                                  "https://th.bing.com/th/id/OIP.jryuUgIHWL-1FVD2ww8oWgHaHa?rs=1&pid=ImgDetMain"),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              leading: Material(
                borderRadius: BorderRadius.circular(AppValues.radius * 16),
                type: MaterialType.card,
                color: AppColors.black.withOpacity(0.15),
                child: Padding(
                  padding: EdgeInsets.all(AppValues.radius * 14),
                  child: DefaultRatingBarIndicator(
                    rating: 1,
                    itemCount: 1,
                    itemSize: AppValues.font * 28,
                    itemPadding: EdgeInsets.zero,
                  ),
                ),
              ),
              title: Row(
                children: [
                  DefaultRatingBarIndicator(
                    rating: 5,
                    itemCount: 5,
                    itemSize: AppValues.font * 18,
                    itemPadding: EdgeInsets.zero,
                  ),
                  SizedBox(
                    width: AppValues.sizeWidth * 8,
                  ),
                  Text(
                    "4.9",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: AppValues.font * 20,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
              subtitle: Text(
                "From 112 reviewers",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: AppColors.greyMedi,
                    fontSize: AppValues.font * 12,
                    fontWeight: FontWeight.w400),
              ),
            )),
        const Divider(
          thickness: 1,
        ),
        DefaultButton(
          height: AppValues.sizeHeight * 60,
          fontSize: AppValues.font * 28,
          onPressed: () => {},
          text: AppStrings.editDetails,
        ),
      ],
    );
  }
}
