import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owner/config/locale/app_localizations.dart';
import 'package:owner/core/components/default_components/default_appbar.dart';
import 'package:owner/core/utils/app_values.dart';
import 'package:owner/core/utils/commons.dart';
import 'package:owner/features/estate_add/data/models/property_model_params.dart';
import '../../../../core/components/default_components/default_button.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../profile/presentation/bloc/profile_bloc.dart';
import '../bloc/cubit/estate_cubit.dart';
import '../bloc/estate_add_bloc.dart';
import 'category_screen.dart';
import 'extra_information_screen.dart';
import 'location_screen.dart';
import 'photo_screen.dart';

class AddEstateScreen extends StatelessWidget {
  const AddEstateScreen({super.key});
  static final List<Widget> _screens = [
    const CategoryScreen(),
    const LocationScreen(),
    const PhotoScreen(),
    const ExtraInformationScreen()
  ];

  static final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<EstateCubit>();
    return BlocListener<EstateAddBloc, EstateAddState>(
      listener: (context, state) {
        if (state is AddEstateLoadingState) {
          context.showLoader();
        } else if (state is AddEstateSucessState) {
          context.hideLoader();
          context.showToastMsg(
              msg: state.message, toastState: ToastStates.success);
          Navigator.of(context).pop();
          cubit.clearData();
          context.read<ProfileBloc>().add(GetUserEvent());
        } else if (state is AddEstateErrorState) {
          context.hideLoader();
          context.showInfoDialog(state.message, AlertDialogType.error);
        }
      },
      child: SafeArea(
        child: Scaffold(
          appBar: const DefaultAppBar(
            addLang: true,
            addLeadingButton: true,
            appBarText: AppStrings.addListing,
          ),
          body: Stack(
            children: [
              //background image
              Positioned(
                left: AppLocalizations.of(context)!.isEnLocale ? null : 0,
                child: Container(
                  height: (AppValues.sizeHeight * 250),
                  width: (AppValues.sizeWidth * 250),
                  padding: EdgeInsets.zero,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppImages.homeCarve),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppValues.paddingWidth * 20),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: AppValues.sizeHeight * 20,
                    ),
                    //page view of add estate process screen.
                    Expanded(
                      child: PageView(
                        physics: const NeverScrollableScrollPhysics(),
                        onPageChanged: (value) {
                          context.read<EstateCubit>().nextOrForward(value);
                        },
                        controller: pageController,
                        children: _screens,
                      ),
                    ),
                    SizedBox(
                      height: AppValues.sizeHeight * 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: AppValues.sizeWidth * 20,
                        ),
                        (context.watch<EstateCubit>().index == 1 ||
                                context.watch<EstateCubit>().index == 2 ||
                                context.watch<EstateCubit>().index == 3)
                            ? GestureDetector(
                                onTap: () {
                                  pageController.previousPage(
                                      duration:
                                          const Duration(milliseconds: 10),
                                      curve: Curves.linear);
                                },
                                child: Material(
                                  elevation: 5,
                                  color: AppColors.white,
                                  type: MaterialType.circle,
                                  child: CircleAvatar(
                                    backgroundColor: AppColors.white,
                                    radius: AppValues.radius * 30,
                                    child: Icon(
                                      color: AppColors.black,
                                      Icons.arrow_back,
                                      size: AppValues.font * 24,
                                    ),
                                  ),
                                ),
                              )
                            : CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius: AppValues.radius * 30,
                              ),
                        SizedBox(
                          width: AppValues.sizeWidth * 12,
                        ),
                        Expanded(
                          child: DefaultButton(
                            height: AppValues.sizeHeight * 60,
                            fontSize: AppValues.font * 28,
                            onPressed: () {
                              int index = context.read<EstateCubit>().index;
                              context.closeKeyboard();
                              if (index == 3 &&
                                  cubit.extraInfoKey.currentState!.validate()) {
                                context.read<EstateAddBloc>().add(AddPropertyEvent(
                                    propertyModel: PropertyModelParams(
                                        subImages: cubit.images,
                                        title: cubit.estateName.text,
                                        description: cubit.estateDesc.text,
                                        categoryId: context
                                            .read<EstateAddBloc>()
                                            .categories[cubit.propertyIndex]
                                            .id,
                                        location:
                                            "${cubit.locationLatitude},${cubit.locationLongtitude}",
                                        type: cubit.isChecked ? 'Rent' : 'Sell',
                                        price: cubit.price.text,
                                        rentType:
                                            cubit.titlesTime[cubit.timeIndex],
                                        features: cubit.getFeature(),
                                        numberOfRooms:
                                            cubit.roomTitles[cubit.roomIndex],
                                        facilities: cubit.envTitles)));
                              } else if (index == 0 &&
                                  cubit.nameKey.currentState!.validate()) {
                                pageController.nextPage(
                                  duration: const Duration(milliseconds: 10),
                                  curve: Curves.linear,
                                );
                              } else if (index == 1 &&
                                  cubit.locationKey.currentState!.validate()) {
                                pageController.nextPage(
                                  duration: const Duration(milliseconds: 10),
                                  curve: Curves.linear,
                                );
                              } else if (index == 2) {
                                if (context
                                    .read<EstateCubit>()
                                    .images
                                    .isNotEmpty) {
                                  pageController.nextPage(
                                    duration: const Duration(milliseconds: 10),
                                    curve: Curves.linear,
                                  );
                                } else {
                                  context.showToastMsg(
                                      msg: AppStrings.pleaseEnterImage,
                                      toastState: ToastStates.warning);
                                }
                              }
                            },
                            text: context.watch<EstateCubit>().index == 3
                                ? AppStrings.finish
                                : AppStrings.next,
                          ),
                        ),
                        SizedBox(
                          width: AppValues.sizeWidth * 12,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: AppValues.radius * 30,
                        ),
                        SizedBox(
                          width: AppValues.sizeWidth * 20,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppValues.sizeHeight * 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
