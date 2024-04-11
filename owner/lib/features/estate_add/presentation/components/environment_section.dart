import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owner/config/locale/app_localizations.dart';
import 'package:owner/core/utils/app_values.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../bloc/cubit/estate_cubit.dart';


class EnvironmentSection extends StatelessWidget {
  const EnvironmentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: AppValues.sizeHeight*14,
        ),
        Text(
          AppStrings.environmentAndFacilities.tr(context),
          textAlign: TextAlign.start,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontSize: AppValues.font*28, color: AppColors.blueDarK),
        ),
        SizedBox(
          height: AppValues.sizeHeight*24,
        ),
        Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: List.generate(
                context.read<EstateCubit>().envTitles.length,
                (index) => EnvironmentAndFaciltitiesCard(
                    title: context.read<EstateCubit>().envTitles[index],
                    index: index)))
      ],
    );
  }
}

class EnvironmentAndFaciltitiesCard extends StatelessWidget {
  final String title;
  final int index;
  const EnvironmentAndFaciltitiesCard({
    super.key,
    required this.title,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = index == context.watch<EstateCubit>().envIndex;
    return GestureDetector(
      key: ValueKey(title.codeUnits),
      onTap: () => context.read<EstateCubit>().changeEnvIndex(index),
      child: Card(
        elevation: 0,
        color: isSelected ? AppColors.blueLight : AppColors.greySoft1,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppValues.radius*28)),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppValues.paddingWidth*28, vertical: AppValues.paddingHeight*18),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: AppValues.font*16,
                fontWeight: FontWeight.w400,
                color: isSelected ? AppColors.white : AppColors.blueDarK),
          ),
        ),
      ),
    );
  }
}
