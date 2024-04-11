import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owner/core/utils/app_values.dart';
import '../../../../core/utils/app_colors.dart';
import '../bloc/cubit/estate_cubit.dart';

class PropertyCard extends StatelessWidget {
  final String title;
  final int index;
  const PropertyCard({super.key, required this.title, required this.index});

  @override
  Widget build(BuildContext context) {
    final isSelected = index == context.watch<EstateCubit>().propertyIndex;
    return GestureDetector(
      key: ValueKey(title.codeUnits),
      onTap: () => context.read<EstateCubit>().changePropertyIndex(index),
      child: Card(
        elevation: 0,
        color: isSelected ? AppColors.blueLight : AppColors.greySoft1,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppValues.radius * 28)),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppValues.paddingWidth * 28,
              vertical: AppValues.paddingHeight * 18),
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
