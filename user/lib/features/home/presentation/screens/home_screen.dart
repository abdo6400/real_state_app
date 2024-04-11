import 'package:flutter/material.dart';
import 'package:user/core/utils/app_values.dart';
import '../../../../config/locale/app_localizations.dart';
import '../../../../core/components/app_components/custom_screen.dart';
import '../../../../core/utils/app_images.dart';
import '../components/explore_nearby_estates_section.dart';
import '../components/home_appbar.dart';
import '../components/top_estate_agent_section.dart';
import '../components/top_location_section.dart';
import '../components/types_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const List<Widget> _sections = [
    HomeAppBar(),
    TypesSection(),
    ExploreNearbyEstatesSection(),
    TopEstateAgent(),
    TopLocationSection(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              left: AppLocalizations.of(context)!.isEnLocale ? null : 0,
              child: Container(
                height: (AppValues.sizeHeight * 220),
                width: (AppValues.sizeWidth * 220),
                padding: EdgeInsets.zero,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppImages.homeCarve),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            ListView.separated(
                padding: EdgeInsets.symmetric(
                    horizontal: AppValues.paddingWidth * 15),
                itemBuilder: ((context, index) {
                  return CustomScreen(
                    index: index,
                    child: _sections[index],
                  );
                }),
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: AppValues.sizeHeight * 20,
                  );
                },
                itemCount: _sections.length),
          ],
        ),
      ),
    );
  }
}
