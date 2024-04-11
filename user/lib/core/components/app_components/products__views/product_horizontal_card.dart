import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user/core/utils/app_values.dart';
import 'package:user/core/utils/commons.dart';
import '../../../../config/locale/app_localizations.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../entities/property.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_strings.dart';

class ProductHorizontalCard extends StatelessWidget {
  final Property item;
  const ProductHorizontalCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppValues.radius * 28),
      child: Container(
        color: AppColors.greySoft1,
        height: AppValues.sizeHeight * 200,
        padding: EdgeInsets.all(AppValues.paddingHeight * 8),
        child: Row(
          children: [
            Flexible(
                flex: 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppValues.radius * 28),
                  child: Stack(
                    children: [
                      GestureDetector(
                        onTap: () => context.navigateTo(
                            screenRoute: Routes.estateRoute, arg: item),
                        child: Image.network(
                          item.image,
                          width: ScreenUtil().screenWidth,
                          height: AppValues.sizeHeight * 300,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned(
                          bottom: AppValues.sizeHeight * 8,
                          left: AppLocalizations.of(context)!.isEnLocale
                              ? AppValues.sizeWidth * 8
                              : null,
                          right: AppLocalizations.of(context)!.isEnLocale
                              ? null
                              : AppValues.sizeWidth * 8,
                          child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: AppValues.paddingWidth * 12,
                                  vertical: AppValues.paddingHeight * 12),
                              decoration: BoxDecoration(
                                  color: AppColors.blueLight.withOpacity(0.69),
                                  borderRadius: BorderRadius.circular(
                                      AppValues.radius * 18)),
                              child: Text(
                                "House",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 0.7,
                                        color: AppColors.white),
                              ))),
                      Positioned(
                          top: AppValues.sizeHeight * 8,
                          left: AppLocalizations.of(context)!.isEnLocale
                              ? AppValues.sizeWidth * 8
                              : null,
                          right: AppLocalizations.of(context)!.isEnLocale
                              ? null
                              : AppValues.sizeWidth * 8,
                          child: GestureDetector(
                            onTap: () {},
                            child: CircleAvatar(
                                radius: AppValues.radius * 20,
                                backgroundColor: false
                                    ? AppColors.primary
                                    : AppColors.white.withOpacity(0.78),
                                child: Icon(
                                  false
                                      ? Icons.favorite
                                      : Icons.favorite_border_outlined,
                                  size: AppValues.font * 20,
                                  color:
                                      false ? AppColors.white : AppColors.error,
                                )),
                          ))
                    ],
                  ),
                )),
            Flexible(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppValues.paddingWidth * 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: AppValues.sizeHeight * 12,
                      ),
                      Text(
                        item.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                fontSize: AppValues.font * 16,
                                fontWeight: FontWeight.w600,
                                color: AppColors.blueDarK),
                      ),
                      SizedBox(
                        height: AppValues.sizeHeight * 12,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: AppValues.font * 18,
                              ),
                              Text(
                                item.ratingsAvg.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        color: AppColors.greyMedi,
                                        fontWeight: FontWeight.bold,
                                        fontSize: AppValues.font * 12),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: AppValues.sizeHeight * 12,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.location_pin,
                                color: AppColors.blueLight,
                                size: AppValues.font * 16,
                              ),
                              SizedBox(
                                width: AppValues.sizeWidth * 2,
                              ),
                              Expanded(
                                child: Text(
                                  item.location[0].toString(),
                                  maxLines: 2,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          color: AppColors.greyMedi,
                                          fontWeight: FontWeight.w400,
                                          fontSize: AppValues.font * 14),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Text(
                            item.price.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.7,
                                    fontSize: AppValues.font * 24,
                                    color: AppColors.blueDarK),
                          ),
                          Text(
                            "/",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: AppColors.blueDarK),
                          ),
                          Text(
                            AppStrings.month,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: AppColors.blueDarK,
                                    fontSize: AppValues.font * 14),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppValues.sizeHeight * 12,
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
