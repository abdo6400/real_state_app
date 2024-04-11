import 'package:flutter/material.dart';
import 'package:user/core/utils/app_values.dart';
import 'filter_type_card.dart';

class FilterTypesSection extends StatelessWidget {
  const FilterTypesSection({super.key});
  static const List<String> _titles = ["All", "House", "Apartment", "Room"];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppValues.sizeHeight * 70,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return FilterTypeCard(title: _titles[index], index: index);
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              width: AppValues.sizeWidth * 7,
            );
          },
          itemCount: _titles.length),
    );
  }
}
