import 'package:flutter/material.dart';
import 'package:user/config/locale/app_localizations.dart';
import '../../../../core/components/app_components/products__views/products_gridview.dart';
import '../../../../core/entities/property.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_values.dart';

class NearbyFromLocationSection extends StatelessWidget {
  final Property property;
  const NearbyFromLocationSection({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.nearbyFromThisLocation.tr(context),
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: AppValues.font * 24,
              fontWeight: FontWeight.w600,
              color: AppColors.blueDarK),
        ),
        SizedBox(
          height: AppValues.sizeHeight * 20,
        ),
        SizedBox(
            height: (AppValues.sizeHeight * 300),
            child: ProductsGridView(
              items: [],
              isScrollable: false,
              loading: true,
            )),
        SizedBox(
          height: AppValues.sizeHeight * 60,
        ),
      ],
    );
  }
}
