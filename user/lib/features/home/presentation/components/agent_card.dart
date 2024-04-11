import 'package:flutter/material.dart';
import 'package:user/config/database/api/end_points.dart';
import 'package:user/core/utils/commons.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/entities/property.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_values.dart';

class AgentCard extends StatelessWidget {
  final Owner owner;
  final int index;
  const AgentCard({super.key, required this.owner, required this.index});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppValues.sizeWidth * 100,
      child: GestureDetector(
        onTap: () => context.navigateTo(
            screenRoute: Routes.topAgentDetailsRoute,
            arg: {"owner": owner, "index": index}),
        child: Column(
          children: [
            CircleAvatar(
              radius: (AppValues.radius * 40),
              backgroundImage: NetworkImage(EndPoints.images + owner.logo),
            ),
            SizedBox(
              height: AppValues.sizeHeight * 12,
            ),
            Text(
              owner.name,
              maxLines: 1,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: AppColors.blueDarK),
            )
          ],
        ),
      ),
    );
  }
}
