import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user/core/components/app_components/products__views/products_gridview.dart';
import 'package:user/core/utils/commons.dart';
import 'package:user/features/home/presentation/bloc/top_locations/top_locations_bloc.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_values.dart';
import 'custom_topbar_section.dart';

class TopLocationSection extends StatelessWidget {
  const TopLocationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopLocationsBloc, TopLocationsState>(
      builder: (context, state) {
        return Column(
          children: [
            CustomTopBarSection(
                title: AppStrings.topLocations,
                subTitle: AppStrings.explore,
                function: () => state is GetTopLocationsLoadedState
                    ? context.navigateTo(
                        screenRoute: Routes.topLocationsRoute,
                        arg: state.properties)
                    : null),
            SizedBox(
              height: AppValues.sizeHeight * 20,
            ),
            SizedBox(
              height: (AppValues.sizeHeight * 300),
              child: ProductsGridView(
                items:
                    state is GetTopLocationsLoadedState ? state.properties : [],
                loading: state is! GetTopLocationsLoadedState,
              ),
            )
          ],
        );
      },
    );
  }
}
