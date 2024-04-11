import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user/core/utils/app_values.dart';
import 'package:user/core/utils/commons.dart';
import 'package:user/features/home/presentation/bloc/top_owners/top_owners_bloc.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/components/default_components/default_loaders.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import 'agent_card.dart';
import 'custom_topbar_section.dart';

class TopEstateAgent extends StatelessWidget {
  const TopEstateAgent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopOwnersBloc, TopOwnersState>(
      builder: (context, state) {
        return Column(
          children: [
            CustomTopBarSection(
                title: AppStrings.topEstateAgent,
                subTitle: AppStrings.explore,
                function: () => state is GetTopOwnersLoadedState
                    ? context.navigateTo(
                        screenRoute: Routes.topAgentsRoute, arg: state.owners)
                    : null),
            SizedBox(
              height: AppValues.sizeHeight * 20,
            ),
            SizedBox(
                height: (AppValues.sizeHeight * 130),
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return state is GetTopOwnersLoadedState
                          ? AgentCard(
                              owner: state.owners[index],
                              index: index,
                            )
                          : ShimmerLoader(
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: (AppValues.radius * 50),
                                  ),
                                  SizedBox(
                                    height: AppValues.sizeHeight * 12,
                                  ),
                                  Container(
                                    height: AppValues.sizeHeight * 12,
                                    width: AppValues.sizeWidth * 80,
                                    decoration: BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius: BorderRadius.circular(
                                            AppValues.radius * 100)),
                                  )
                                ],
                              ),
                            );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: AppValues.sizeWidth * 16,
                      );
                    },
                    itemCount: state is GetTopOwnersLoadedState
                        ? state.owners.length
                        : 6)),
          ],
        );
      },
    );
  }
}
