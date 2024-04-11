import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owner/config/locale/app_localizations.dart';
import '../../../../core/components/default_components/default_form_field.dart';
import '../../../../core/utils/app_values.dart';
import '../bloc/cubit/estate_cubit.dart';
import '../bloc/estate_add_bloc.dart';
import 'property_card.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';

class CategoryDetailsSection extends StatelessWidget {
  const CategoryDetailsSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<EstateCubit>().nameKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: AppValues.sizeHeight * 14,
          ),
          //name
          Text(
            AppStrings.listingType.tr(context),
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: AppValues.font * 28,
                  color: AppColors.blueDarK,
                ),
          ),
          SizedBox(
            height: AppValues.sizeHeight * 14,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(AppValues.radius * 28),
            child: DefaultTextFormField(
              suffix: Icons.home_outlined,
              controller: context.read<EstateCubit>().estateName,
              contentPadding: EdgeInsets.symmetric(
                vertical: AppValues.paddingHeight * 28,
                horizontal: AppValues.paddingWidth * 16,
              ),
              type: TextInputType.text,
              hint: AppStrings.name,
              label: AppStrings.name,
              validate: (data) {
                if (data!.isEmpty) {
                  return AppStrings.pleaseEnterValidName.tr(context);
                }
                return null;
              },
            ),
          ),
          SizedBox(
            height: AppValues.sizeHeight * 14,
          ),
          //description
          Text(
            AppStrings.description.tr(context),
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: AppValues.font * 28,
                  color: AppColors.blueDarK,
                ),
          ),
          SizedBox(
            height: AppValues.sizeHeight * 14,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(AppValues.radius * 28),
            child: DefaultTextFormField(
              // suffix: Icons.detail,
              controller: context.read<EstateCubit>().estateDesc,
              contentPadding: EdgeInsets.symmetric(
                vertical: AppValues.paddingHeight * 28,
                horizontal: AppValues.paddingWidth * 16,
              ),

              type: TextInputType.text,
              hint: AppStrings.description,
              label: AppStrings.description,
              validate: (data) {
                if (data!.isEmpty) {
                  return AppStrings.pleaseEnterValidDesc.tr(context);
                }
                return null;
              },
            ),
          ),
          SizedBox(
            height: AppValues.sizeHeight * 14,
          ),
          Text(
            AppStrings.propertyCategory.tr(context),
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: AppValues.font * 24,
                  color: AppColors.blueDarK,
                ),
          ),
          SizedBox(
            height: AppValues.sizeHeight * 20,
          ),
          BlocConsumer<EstateAddBloc, EstateAddState>(
            builder: (context, state) {
              return Wrap(
                spacing: 8.0.w,
                runSpacing: 8.0.w,
                children: List.generate(
                  context.read<EstateAddBloc>().categories.length,
                  (index) => PropertyCard(
                    title: context.read<EstateAddBloc>().categories[index].name,
                    index: index,
                  ),
                ),
              );
            },
            listener: (BuildContext context, EstateAddState state) {},
          ),
        ],
      ),
    );
  }
}
