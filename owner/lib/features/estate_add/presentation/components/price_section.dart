import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owner/config/locale/app_localizations.dart';
import 'package:owner/core/utils/app_values.dart';
import '../../../../core/components/default_components/default_form_field.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../bloc/cubit/estate_cubit.dart';
import 'custom_check_box.dart';
import 'type_time_section.dart';

class PriceSection extends StatelessWidget {
  const PriceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<EstateCubit>().extraInfoKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const EstateType(),
          context.watch<EstateCubit>().isChecked
              ? PriceComponent(
                  title: AppStrings.rentPrice.tr(context),
                  hint: AppStrings.rentPrice,
                  controller: context.read<EstateCubit>().price,
                )
              : PriceComponent(
                  title: AppStrings.sellPrice.tr(context),
                  hint: AppStrings.sellPrice,
                  controller: context.read<EstateCubit>().price,
                ),
        ],
      ),
    );
  }
}

class EstateType extends StatelessWidget {
  const EstateType({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //estate type [rent or sell]
        Text(
          AppStrings.estateType.tr(context),
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: AppValues.font * 28, color: AppColors.blueDarK),
        ),
        SizedBox(
          height: AppValues.sizeHeight * 14,
        ),
        //rent or sell
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomCheckBox(
                title: AppStrings.rent.tr(context),
                function: () {
                  context.read<EstateCubit>().changeCheckState(true);
                },
                isChecked: context.watch<EstateCubit>().isChecked),
            CustomCheckBox(
              title: AppStrings.sell.tr(context),
              function: () {
                context.read<EstateCubit>().changeCheckState(false);
              },
              isChecked: !context.watch<EstateCubit>().isChecked,
            ),
            SizedBox(
              height: AppValues.sizeHeight * 14,
            ),
          ],
        ),
      ],
    );
  }
}

class PriceComponent extends StatelessWidget {
  const PriceComponent({
    super.key,
    required this.title,
    required this.hint,
    required this.controller,
  });
  final String title;
  final String hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //rent price
        Text(
          title,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: AppValues.font * 28, color: AppColors.blueDarK),
        ),
        SizedBox(
          height: AppValues.sizeHeight * 24,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(AppValues.radius * 28),
          child: DefaultTextFormField(
            suffix: Icons.currency_pound_outlined,
            controller: controller,
            contentPadding: EdgeInsets.symmetric(
                vertical: AppValues.paddingHeight * 28,
                horizontal: AppValues.paddingWidth * 20),
            color: AppColors.greySoft1,
            type: TextInputType.text,
            hint: hint,
            label: null,
            validate: (data) {
              if (data!.isEmpty) {
                return AppStrings.pleaseEnterValidPrice.tr(context);
              }
              return null;
            },
          ),
        ),
        SizedBox(
          height: AppValues.sizeHeight * 14,
        ),
        context.watch<EstateCubit>().isChecked
            ? const TypeTimeSection()
            : Container(),
      ],
    );
  }
}
