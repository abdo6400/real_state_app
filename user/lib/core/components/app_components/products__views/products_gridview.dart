import 'package:flutter/material.dart';
import '../../../entities/property.dart';
import '../../../utils/app_strings.dart';
import '../../../utils/app_values.dart';
import '../../default_components/default_message_card.dart';
import '../../default_components/default_loaders.dart';
import 'product_vertical_card.dart';

class ProductsGridView extends StatelessWidget {
  final List<Property> items;
  final bool isScrollable;
  final bool loading;
  const ProductsGridView(
      {super.key,
      required this.items,
      this.isScrollable = true,
      required this.loading});

  @override
  Widget build(BuildContext context) {
    return items.isEmpty && !loading
        ? const DefaultMessageCard(
            sign: '0_0',
            title: AppStrings.noEstatesInYet,
            subTitle: AppStrings.yourListingIsEmpty,
          )
        : GridView.builder(
            itemCount: loading ? 6 : items.length,
            padding: EdgeInsets.only(bottom: AppValues.paddingHeight * 20),
            shrinkWrap: true,
            physics: isScrollable ? null : const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: (AppValues.sizeHeight * 200),
                crossAxisSpacing: AppValues.sizeWidth * 12,
                mainAxisSpacing: AppValues.sizeHeight * 12,
                crossAxisCount: 1),
            itemBuilder: (context, index) {
              return loading
                  ? ShimmerLoader(
                      width: double.infinity,
                      borderRadius: AppValues.radius * 28,
                    )
                  : ProductVerticalCard(item: items[index]);
            });
  }
}
