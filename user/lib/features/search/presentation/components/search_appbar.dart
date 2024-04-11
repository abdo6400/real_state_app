import 'package:flutter/material.dart';
import 'package:user/core/utils/app_values.dart';
import '../../../../core/components/default_components/default_form_field.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';

class SearchAppBar extends StatelessWidget {
  const SearchAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppValues.paddingWidth * 20),
      child: Column(
        children: [
          SizedBox(
            height: AppValues.sizeHeight * 20,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(AppValues.radius * 12),
            child: Card(
              color: AppColors.greySoft1,
              child: DefaultTextFormField(
                  prefix: Icons.search,
                  suffix: Icons.mic_rounded,
                  onTap: () {},
                  controller: TextEditingController(),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: AppValues.paddingHeight * 20),
                  color: AppColors.greySoft1,
                  type: TextInputType.text,
                  hint: AppStrings.searchAbout,
                  label: null),
            ),
          ),
          SizedBox(
            height: AppValues.sizeHeight * 20,
          ),
          /*  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    AppStrings.found.tr(context),
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: AppColors.blueDarK,
                        fontSize: AppValues.font * 18,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: AppValues.sizeWidth * 12,
                  ),
                  Text(
                    "0",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: AppColors.blueLight),
                  ),
                  SizedBox(
                    width: AppValues.sizeWidth * 12,
                  ),
                  Text(
                    AppStrings.estates.tr(context),
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: AppColors.blueDarK,
                        fontSize: AppValues.font * 18,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
               ViewSelectionCard(
                selectedIndex: context.watch<SearchCubit>().index,
                function1: () => context.read<SearchCubit>().changeIndex(0),
                function2: () => context.read<SearchCubit>().changeIndex(1),
              )
            ],
          ),*/
          SizedBox(
            height: AppValues.sizeHeight * 20,
          ),
        ],
      ),
    );
  }
}
