import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latlong2/latlong.dart';
import 'package:owner/config/locale/app_localizations.dart';
import 'package:owner/core/utils/app_values.dart';
import '../../../../core/components/default_components/default_form_field.dart';
import '../../../../core/components/map/presentation/components/location_map_card.dart';
import '../../../../core/utils/app_strings.dart';
import '../bloc/cubit/estate_cubit.dart';

class LocationSection extends StatelessWidget {
  const LocationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<EstateCubit>().locationKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LocationMapCard(
            title: AppStrings.selectOnMap,
            height: AppValues.sizeHeight * 400,
            function: (LatLng location) => context
                .read<EstateCubit>()
                .getLocation(
                    locationLatitude: location.latitude,
                    locationLongtitude: location.longitude),
          ),
          SizedBox(
            height: AppValues.sizeHeight * 30,
          ),
          DefaultTextFormField(
            onTap: () {},
            controller: context.read<EstateCubit>().address,
            type: TextInputType.streetAddress,
            prefix: Icons.location_pin,
            suffix: Icons.arrow_forward,
            readOnly: true,
            label: null,
            hint: AppStrings.locationDetail,
            validate: (data) {
              if (data!.isEmpty) {
                return AppStrings.enterAdressInDetails.tr(context);
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
