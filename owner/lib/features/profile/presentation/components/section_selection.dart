import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owner/config/locale/app_localizations.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_values.dart';
import '../bloc/cubit/profile_cubit.dart';

class SectionSelection extends StatelessWidget {
  const SectionSelection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: AppValues.marginWidth * 60),
      elevation: 0,
      color: AppColors.greySoft1,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppValues.radius * 28)),
      child: Padding(
          padding: EdgeInsets.symmetric(vertical: AppValues.paddingHeight * 8),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _TypeCard(
                title: AppStrings.transaction,
                index: 0,
              ),
              _TypeCard(
                title: AppStrings.listings,
                index: 1,
              ),
            ],
          )),
    );
  }
}

class _TypeCard extends StatelessWidget {
  final String title;
  final int index;
  const _TypeCard({
    required this.title,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = index == context.watch<ProfileCubit>().selectedSection;
    return GestureDetector(
      onTap: () => context.read<ProfileCubit>().changeSelectedSection(index),
      child: Card(
        elevation: 0,
        margin: EdgeInsets.zero,
        color: isSelected ? AppColors.white : AppColors.greySoft1,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppValues.radius * 28)),
        child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppValues.paddingWidth * 28,
                vertical: AppValues.paddingHeight * 8),
            child: Text(
              title.tr(context),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: isSelected ? AppColors.blueDarK : AppColors.greyBarel),
            )),
      ),
    );
  }
}
