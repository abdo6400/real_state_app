import 'package:flutter/material.dart';
import 'package:user/config/database/api/end_points.dart';
import '../../../../core/entities/property.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_values.dart';

class AgentDetailsSection extends StatelessWidget {
  final Property property;
  const AgentDetailsSection({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
                horizontal: AppValues.paddingWidth * 8,
                vertical: AppValues.paddingHeight * 12),
            decoration: BoxDecoration(
                color: AppColors.greySoft1,
                borderRadius: BorderRadius.circular(AppValues.radius * 20)),
            child: ListTile(
              title: Text(
                property.owner.name,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: AppColors.blueDarK,
                    fontSize: AppValues.font * 18,
                    fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                property.description,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: AppColors.greyMedi,
                    fontSize: AppValues.font * 12,
                    fontWeight: FontWeight.w400),
              ),
              leading: CircleAvatar(
                radius: (AppValues.radius * 44),
                backgroundColor: AppColors.greySoft1,
                child: CircleAvatar(
                    backgroundColor: AppColors.greySoft1,
                    radius: (AppValues.radius * 78),
                    backgroundImage: NetworkImage(
                  EndPoints.images+    property.owner.logo,
                    )),
              ),
              trailing: const Icon(
                Icons.chat_outlined,
                color: AppColors.blueDarK,
              ),
            )),
        SizedBox(
          height: AppValues.sizeHeight * 20,
        ),
        SizedBox(
          height: AppValues.sizeHeight * 70,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 0,
                  color: AppColors.greySoft1,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(AppValues.radius * 28)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppValues.paddingWidth * 28,
                        vertical: AppValues.paddingHeight * 18),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.featured_play_list,
                          color: AppColors.primary,
                        ),
                        SizedBox(
                          width: AppValues.sizeWidth * 12,
                        ),
                        Text(
                          "${property.features[index].split(",")[1]} ${property.features[index].split(",")[0]}",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  fontSize: AppValues.font * 16,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.blueDarK),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: AppValues.sizeWidth * 12,
                );
              },
              itemCount: property.features.length),
        ),
        SizedBox(
          height: AppValues.sizeHeight * 60,
        ),
      ],
    );
  }
}
