import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/components/default_components/default_button.dart';
import '../../../../core/entities/property.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_values.dart';
import '../components/estate_appbar.dart';
import '../components/estate_full_details_section.dart';
import '../components/estate_short_details_section.dart';

class EstateScreen extends StatelessWidget {
  const EstateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Property property =
        ModalRoute.of(context)?.settings.arguments as Property;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: ScreenUtil().screenHeight,
          width: ScreenUtil().screenWidth,
          child: Stack(
            children: [
              Column(
                children: [
                  Flexible(
                    flex: 2,
                    child: EstateAppBar(
                      property: property,
                    ),
                  ),
                  Flexible(
                      flex: 3,
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppValues.paddingWidth * 28),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                EstateShortDetailsSection(
                                  property: property,
                                ),
                                EstateFullDetailsSection(
                                  property: property,
                                )
                              ],
                            ),
                          ))),
                ],
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.white.withOpacity(0.7),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(AppValues.radius * 100),
                          topRight: Radius.circular(AppValues.radius * 100))),
                  child: DefaultButton(
                    height: AppValues.sizeHeight * 60,
                    fontSize: AppValues.font * 24,
                    margin: EdgeInsets.symmetric(
                        horizontal: (AppValues.marginWidth * 80),
                        vertical: AppValues.marginHeight * 14),
                    onPressed: () {},
                    text: AppStrings.startChat,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
