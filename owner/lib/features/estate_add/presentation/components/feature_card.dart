import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owner/config/locale/app_localizations.dart';
import 'package:owner/core/utils/app_values.dart';
import '../../../../core/utils/app_colors.dart';
import '../bloc/cubit/estate_cubit.dart';

class FeatureCard extends StatelessWidget {
  const FeatureCard({
    super.key,
    required this.type,
    required this.nameOfFeature,
  });
  final int type;
  final String nameOfFeature;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: AppValues.paddingHeight * 20,
          horizontal: AppValues.paddingWidth * 16),
      decoration: BoxDecoration(
        color: AppColors.greySoft1,
        borderRadius: BorderRadius.circular(AppValues.radius * 28),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //feature name
          Text(
            nameOfFeature.tr(context),
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: AppColors.blueDarK),
          ),
          Row(
            children: [
              //increment the number of feature by 1.
              Material(
                color: AppColors.greyBarel,
                type: MaterialType.card,
                borderRadius: BorderRadius.circular(AppValues.radius * 12),
                child: Center(
                  child: IconButton(
                    onPressed: () {
                      context
                          .read<EstateCubit>()
                          .changeNumberOfFeature('+', type);
                    },
                    icon: Icon(
                      Icons.add,
                      color: AppColors.white,
                      size: AppValues.font * 28,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: AppValues.sizeWidth * 16,
              ),
              //display the number of feature.
              Text(
                context.watch<EstateCubit>().getValueOfFeature(type).toString(),
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: AppColors.blueDarK),
              ),
              SizedBox(
                width: AppValues.sizeWidth * 16,
              ),
              //decrement the number of feature by 1.
              Material(
                color: AppColors.greyBarel,
                type: MaterialType.card,
                borderRadius: BorderRadius.circular(AppValues.radius * 16),
                child: Center(
                  child: IconButton(
                    onPressed: () {
                      context
                          .read<EstateCubit>()
                          .changeNumberOfFeature('-', type);
                    },
                    icon: Icon(
                      Icons.remove,
                      color: AppColors.white,
                      size: AppValues.font * 28,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
