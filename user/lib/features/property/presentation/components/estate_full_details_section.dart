import 'package:flutter/material.dart';
import '../../../../core/components/app_components/custom_screen.dart';
import '../../../../core/entities/property.dart';
import 'agent_details_section.dart';
import 'cost_of_living_section.dart';
import 'location_details_section.dart';
import 'reviews_section.dart';

class EstateFullDetailsSection extends StatelessWidget {
  final Property property;
  const EstateFullDetailsSection({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return CustomScreen(
        index: 1,
        child: Column(
          children: [
            AgentDetailsSection(property: property),
            LocationDetailsSection(property: property),
            CostOfLivingSection(property: property),
            ReviewsSection(property: property),
           // NearbyFromLocationSection(property: property)
          ],
        ));
  }
}
