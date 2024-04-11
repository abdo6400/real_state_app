import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owner/config/locale/app_localizations.dart';
import 'package:owner/core/components/default_components/default_appbar.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/components/app_components/products__views/listing_gridview.dart';
import '../../../../core/components/custom_components/message_card.dart';
import '../../../../core/utils/app_values.dart';
import '../../../../core/utils/commons.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../estate_add/presentation/bloc/cubit/estate_cubit.dart';
import '../bloc/cubit/profile_cubit.dart';
import '../bloc/profile_bloc.dart' as data;

import '../components/profile_top_section.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: DefaultAppBar(
              appBarText: AppStrings.profile,
              leading: GestureDetector(
                onTap: () {},
                child: CircleAvatar(
                  radius: (AppValues.radius * 28),
                  backgroundColor: AppColors.primary,
                  child: CircleAvatar(
                    radius: (AppValues.radius * 24),
                    backgroundColor: AppColors.white,
                    child: Icon(
                      Icons.notifications_outlined,
                      color: AppColors.blueDarK,
                      size: AppValues.font * 30,
                    ),
                  ),
                ),
              ),
              widgets: [
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppValues.paddingWidth * 10,
                      vertical: AppValues.paddingHeight * 10,
                    ),
                    child: CircleAvatar(
                        backgroundColor: AppColors.lightGrey.withOpacity(0.5),
                        radius: (AppValues.radius * 30),
                        child: Icon(
                          Icons.settings_outlined,
                          color: AppColors.blueDarK,
                          size: AppValues.font * 25,
                        )),
                  ),
                )
              ],
              addLang: false,
              addLeadingButton: true,
            ),
            body: ListView(
                padding: EdgeInsets.symmetric(
                    horizontal: AppValues.paddingWidth * 20),
                children: [
                  SizedBox(
                    height: AppValues.sizeHeight * 28,
                  ),
                  const ProfileTopSection(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          BlocBuilder<data.ProfileBloc, data.ProfileState>(
                            builder: (context, state) {
                              final bool isLoaded =
                                  state is data.UserLoadedState;
                              return Text(
                                isLoaded
                                    ? state.user.user.properties.length
                                        .toString()
                                    : "0",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(color: AppColors.blueLight),
                              );
                            },
                          ),
                          SizedBox(
                            width: AppValues.sizeWidth * 12,
                          ),
                          Text(
                            context.watch<ProfileCubit>().selectedSection == 1
                                ? AppStrings.listings.tr(context)
                                : AppStrings.transaction.tr(context),
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                    color: AppColors.blueDarK,
                                    fontSize: AppValues.font * 18,
                                    fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Card(
                            margin: EdgeInsets.zero,
                            elevation: 0,
                            color: AppColors.greySoft1,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    AppValues.radius * 28)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: AppValues.paddingWidth * 12,
                                  vertical: AppValues.paddingHeight * 8),
                              child: Card(
                                elevation: 0,
                                margin: EdgeInsets.zero,
                                color: AppColors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        AppValues.radius * 28)),
                                child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: AppValues.paddingWidth * 12,
                                        vertical: AppValues.paddingHeight * 12),
                                    child: Icon(
                                      Icons.dashboard_rounded,
                                      color: AppColors.blueDarK,
                                      size: AppValues.font * 18,
                                    )),
                              ),
                            ),
                          ),
                          (context.watch<ProfileCubit>().selectedSection == 1)
                              ? Row(
                                  children: [
                                    SizedBox(
                                      width: AppValues.sizeWidth * 12,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        context.read<EstateCubit>().clearData();
                                        context.navigateTo(
                                            screenRoute: Routes.addEstateRoute);
                                      },
                                      child: CircleAvatar(
                                        radius: AppValues.radius * 28,
                                        backgroundColor: AppColors.blueLight,
                                        child: const Icon(
                                          Icons.add,
                                          color: AppColors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : const SizedBox()
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: AppValues.sizeHeight * 20,
                  ),
                  BlocBuilder<data.ProfileBloc, data.ProfileState>(
                    builder: (context, user) {
                      final bool isLoaded = user is data.UserLoadedState;
                      return SizedBox(
                        height: (AppValues.sizeHeight * 400),
                        child: BlocBuilder<ProfileCubit, ProfileState>(
                            builder: (context, state) {
                          return (context
                                      .watch<ProfileCubit>()
                                      .selectedSection ==
                                  0)
                              ? const MessageCard(
                                  sign: '!',
                                  title: AppStrings.transaction,
                                  subTitle: '',
                                )
                              : ListingGridView(
                                  items:
                                      isLoaded ? user.user.user.properties : [],
                                  isScrollable: true,
                                  loading: !isLoaded,
                                );
                        }),
                      );
                    },
                  )
                ])));
  }
}
