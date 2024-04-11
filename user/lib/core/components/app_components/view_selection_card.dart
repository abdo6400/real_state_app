import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_values.dart';

class ViewSelectionCard extends StatelessWidget {
  final int selectedIndex;
  final Function function1;
  final Function function2;
  const ViewSelectionCard(
      {super.key,
      required this.selectedIndex,
      required this.function1,
      required this.function2});

  @override
  Widget build(BuildContext context) {
    final isSelected = selectedIndex == 0;
    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      color: AppColors.greySoft1,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppValues.radius * 28)),
      child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppValues.paddingWidth * 18,
              vertical: AppValues.paddingHeight * 8),
          child: Row(
            children: [
              _TypeCard(
                iconData: Icons.widgets,
                isSelected: isSelected,
                function: function1,
              ),
              _TypeCard(
                iconData: Icons.view_stream,
                isSelected: !isSelected,
                function: function2,
              ),
            ],
          )),
    );
  }
}

class _TypeCard extends StatelessWidget {
  final IconData iconData;
  final bool isSelected;
  final Function function;
  const _TypeCard({
    required this.iconData,
    required this.isSelected,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => function(),
      child: Card(
        elevation: 0,
        margin: EdgeInsets.zero,
        color: isSelected ? AppColors.white : AppColors.greySoft1,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppValues.radius * 28)),
        child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppValues.paddingWidth * 18,
                vertical: AppValues.paddingHeight * 12),
            child: Icon(
              iconData,
              color: isSelected ? AppColors.blueDarK : AppColors.greyBarel,
              size: AppValues.font * 18,
            )),
      ),
    );
  }
}
