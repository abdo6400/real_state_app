import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user/config/database/api/end_points.dart';
import 'package:user/core/components/default_components/default_rating_bar_indicator.dart';
import 'package:user/core/utils/commons.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../features/favorite/presentation/bloc/favorite_bloc.dart';
import '../../../entities/property.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_values.dart';

class ProductVerticalCard extends StatelessWidget {
  final Property item;

  const ProductVerticalCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppValues.radius * 28),
      child: Container(
        color: AppColors.greySoft1,
        padding: EdgeInsets.all(AppValues.sizeHeight * 8),
        child: Column(
          children: [
            Flexible(
                flex: 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppValues.radius * 28),
                  child: Stack(
                    children: [
                      GestureDetector(
                        onTap: () => context.navigateTo(
                            screenRoute: Routes.estateRoute, arg: item),
                        child: Image.network(
                          EndPoints.images + item.image,
                          width: ScreenUtil().screenWidth,
                          height: AppValues.sizeHeight * 300,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned(
                          bottom: AppValues.sizeHeight * 8,
                          right: AppValues.sizeWidth * 8,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: AppValues.paddingWidth * 12,
                                vertical: AppValues.paddingHeight * 12),
                            decoration: BoxDecoration(
                                color: AppColors.blueLight.withOpacity(0.69),
                                borderRadius: BorderRadius.circular(
                                    AppValues.radius * 18)),
                            child: Row(
                              children: [
                                Text(
                                  item.price.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.7,
                                          color: AppColors.white),
                                ),
                                if (item.type.toLowerCase().compareTo("rent") ==
                                    0)
                                  Text(
                                    "/",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(color: AppColors.white),
                                  ),
                                if (item.type.toLowerCase().compareTo("rent") ==
                                    0)
                                  Text(
                                    item.rentType!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                            color: AppColors.white,
                                            fontSize: AppValues.font * 12),
                                  ),
                              ],
                            ),
                          )),
                      Positioned(
                          top: AppValues.sizeHeight * 8,
                          right: AppValues.sizeWidth * 8,
                          child: GestureDetector(
                            onTap: () => context
                                .read<FavoriteBloc>()
                                .add(EditFavoriteEvent(id: item.id)),
                            child: CircleAvatar(
                                radius: AppValues.radius * 20,
                                backgroundColor: context
                                        .watch<FavoriteBloc>()
                                        .favoriteItems
                                        .contains(item.id)
                                    ? AppColors.primary
                                    : AppColors.white.withOpacity(0.78),
                                child: Icon(
                                  context
                                          .watch<FavoriteBloc>()
                                          .favoriteItems
                                          .contains(item.id)
                                      ? Icons.favorite
                                      : Icons.favorite_border_outlined,
                                  size: AppValues.font * 20,
                                  color: context
                                          .watch<FavoriteBloc>()
                                          .favoriteItems
                                          .contains(item.id)
                                      ? AppColors.white
                                      : AppColors.error,
                                )),
                          ))
                    ],
                  ),
                )),
            Flexible(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppValues.paddingWidth * 12),
                  child: Column(
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
                      const Spacer(),
                      DefaultRatingBarIndicator(
                          rating: double.parse(item.ratingsAvg),
                          itemCount: 5,
                          itemSize: AppValues.font * 20),
                      SizedBox(
                        height: AppValues.sizeHeight * 8,
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
