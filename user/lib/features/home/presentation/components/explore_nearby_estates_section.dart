import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user/core/utils/app_values.dart';
import '../../../../core/components/app_components/products__views/products_gridview.dart';
import '../../../../core/utils/app_strings.dart';
import '../bloc/nearby_locations/nearby_locations_bloc.dart';
import 'custom_topbar_section.dart';

class ExploreNearbyEstatesSection extends StatelessWidget {
  const ExploreNearbyEstatesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NearbyLocationsBloc, NearbyLocationsState>(
      builder: (context, state) {
        return Column(
          children: [
            CustomTopBarSection(
                title: AppStrings.exploreNearbyEstates,
                subTitle: AppStrings.explore,
                addButton: false,
                function: () {}),
            SizedBox(
              height: AppValues.sizeHeight * 20,
            ),
            SizedBox(
              height: (AppValues.sizeHeight * 300),
              child: ProductsGridView(
                items: state is GetNearbyLocationsLoadedState
                    ? state.properties
                    : [],
                loading: state is! GetNearbyLocationsLoadedState,
              ),
            )
          ],
        );
      },
    );
  }
}
