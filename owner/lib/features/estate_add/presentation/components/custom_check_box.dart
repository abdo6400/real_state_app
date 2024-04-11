import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_values.dart';

class CustomCheckBox extends StatelessWidget {
  final String title;
  final bool isChecked;
  final VoidCallback function;
  const CustomCheckBox({
    super.key,
    required this.title,
    required this.isChecked,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => function(),
          child: Container(
              width: AppValues.sizeWidth*24,
              height: AppValues.sizeHeight*28,
              margin: EdgeInsets.all(AppValues.radius*14),
              padding: EdgeInsets.all(AppValues.radius),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppValues.radius*8),
                  border: Border.all(
                      width: 2,
                      color:
                          isChecked ? AppColors.primary : AppColors.lightGrey)),
              child: Icon(Icons.check,
                  size: AppValues.font*20,
                  weight: 0.2,
                  color: isChecked ? AppColors.primary : AppColors.white)),
        ),
        Text(
          title,
        ),
      ],
    );
  }
}
