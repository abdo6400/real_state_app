import 'package:flutter/material.dart';
import 'package:user/core/utils/app_values.dart';
import '../../../../core/utils/app_colors.dart';

class FilterTypeCard extends StatelessWidget {
  final String title;
  final int index;
  const FilterTypeCard({super.key, required this.title, required this.index});

  @override
  Widget build(BuildContext context) {
    final isSelected = index == 0;
    return GestureDetector(
      onTap: () {},
      child: Card(
        elevation: 0,
        color: isSelected ? AppColors.blueLight : AppColors.greySoft1,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppValues.radius * 28)),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppValues.paddingWidth * 28,
              vertical: AppValues.paddingHeight * 20),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: AppValues.font * 16,
                fontWeight: FontWeight.w400,
                color: isSelected ? AppColors.white : AppColors.blueDarK),
          ),
        ),
      ),
    );
  }
}
