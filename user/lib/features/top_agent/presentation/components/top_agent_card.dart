import 'package:flutter/material.dart';
import 'package:user/config/database/api/end_points.dart';
import '../../../../core/entities/property.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_values.dart';

class TopAgentCard extends StatelessWidget {
  final Owner owner;
  final int index;
  const TopAgentCard({super.key, required this.owner, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //  onTap: () => context.navigateTo(screenRoute: Routes.topAgentDetailsRoute, arg: {"owner":owner,"index":index}),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppValues.radius * 28),
        child: Container(
          color: AppColors.greySoft1,
          padding: EdgeInsets.all(AppValues.radius * 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppValues.paddingWidth * 8,
                    vertical: AppValues.paddingHeight * 12),
                child: Row(
                  children: [
                    Material(
                        type: MaterialType.card,
                        color: AppColors.primary,
                        borderRadius:
                            BorderRadius.circular(AppValues.radius * 14),
                        child: Padding(
                          padding: EdgeInsets.all(AppValues.radius * 8),
                          child: Text(
                            "#$index",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: AppColors.white),
                          ),
                        )),
                  ],
                ),
              ),
              CircleAvatar(
                radius: (AppValues.radius * 64),
                backgroundColor: AppColors.white,
                child: CircleAvatar(
                  radius: AppValues.radius * 60,
                  child: CircleAvatar(
                      radius: (AppValues.radius * 78),
                      backgroundImage:
                          NetworkImage(EndPoints.images + owner.logo)),
                ),
              ),
              SizedBox(
                height: AppValues.sizeHeight * 4,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppValues.paddingWidth * 12,
                    vertical: AppValues.paddingHeight * 12),
                child: Text(
                  owner.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: AppValues.font * 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blueDarK),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    owner.email.toString(),
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColors.greyMedi,
                        fontWeight: FontWeight.bold,
                        fontSize: AppValues.font * 12),
                  ),
                  SizedBox(
                    width: AppValues.sizeWidth * 2,
                  ),
                  SizedBox(
                    width: AppValues.sizeWidth * 2,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
