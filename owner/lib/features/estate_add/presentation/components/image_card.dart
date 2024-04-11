import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_values.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (AppValues.sizeHeight * 65),
      width: (AppValues.sizeWidth * 63),
      child: Material(
        type: MaterialType.card,
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppValues.radius * 14),
        child: Padding(
            padding: EdgeInsets.all(AppValues.radius * 4),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppValues.radius * 14),
              child: Image.network(
                "https://th.bing.com/th/id/OIP.cAFEH-htOAfWu78CTDNaVwHaEK?pid=ImgDet&rs=1",
                fit: BoxFit.fill,
              ),
            )),
      ),
    );
  }
}
