import 'package:flutter/material.dart';
import 'package:user/config/database/api/end_points.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_values.dart';
import '../../domain/entities/category.dart';

class TypeCard extends StatelessWidget {
  final Category category;
  final int index;
  const TypeCard({super.key, required this.category, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        elevation: 0,
        color: AppColors.greySoft1,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppValues.radius * 28)),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppValues.paddingWidth * 18,
              vertical: AppValues.paddingHeight * 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: (AppValues.radius * 20),
                backgroundColor: AppColors.greySoft2,
                child: CircleAvatar(
                  radius: (AppValues.radius * 20),
                  backgroundColor: AppColors.white,
                  child: CircleAvatar(
                    radius: (AppValues.radius * 20),
                    backgroundColor: AppColors.greySoft2,
                    backgroundImage:
                        NetworkImage(EndPoints.images + category.logo),
                  ),
                ),
              ),
              SizedBox(
                width: AppValues.sizeWidth * 10,
              ),
              Text(
                category.name,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: AppValues.font * 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.blueDarK),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
