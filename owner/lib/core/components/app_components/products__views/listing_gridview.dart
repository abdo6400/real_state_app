import 'package:flutter/material.dart';
import '../../../entities/property.dart';
import '../../../utils/app_values.dart';
import '../../default_components/default_loaders.dart';
import 'listing_card.dart';

class ListingGridView extends StatelessWidget {
  final List<Property> items;
  final bool isScrollable;
  final bool loading;
  const ListingGridView(
      {super.key,
      required this.items,
      this.isScrollable = true,
      required this.loading});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: loading ? 6 : items.length,
        padding: EdgeInsets.only(bottom: AppValues.paddingHeight*200),
        shrinkWrap: true,
        physics: isScrollable ? const ClampingScrollPhysics() : const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: (AppValues.sizeHeight * 300),
            crossAxisSpacing: AppValues.sizeWidth * 12,
            mainAxisSpacing: AppValues.sizeHeight * 12,
            crossAxisCount: 2),
        itemBuilder: (context, index) {
          return loading
              ? ShimmerLoader(
                  width: double.infinity,
                  borderRadius: AppValues.radius * 28,
                )
              : ListingCard(item: items[index]);
        });
  }
}
