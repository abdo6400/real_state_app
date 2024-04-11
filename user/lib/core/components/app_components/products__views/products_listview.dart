import 'package:flutter/material.dart';
import 'package:user/core/utils/app_values.dart';

import '../../../entities/property.dart';
import '../../default_components/default_loaders.dart';
import 'product_horizontal_card.dart';


class ProductsListView extends StatelessWidget {
  final List<Property> items;
  final bool loading;
  const ProductsListView(
      {super.key, required this.items, required this.loading});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.only(bottom: (AppValues.sizeHeight*100)),
        itemBuilder: ((context, index) {
          return loading
              ? ShimmerLoader(
                  width: double.infinity,
                  height: (AppValues.sizeHeight*100),
                  borderRadius: AppValues.radius*28,
                )
              : ProductHorizontalCard(
                  item: items[index],
                );
        }),
        separatorBuilder: (context, index) {
          return SizedBox(
            height: AppValues.sizeHeight*12,
          );
        },
        itemCount: loading ? 6 : items.length);
  }
}
