import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user/config/database/api/end_points.dart';
import 'package:user/config/locale/app_localizations.dart';
import '../../../../core/components/default_components/default_loaders.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_values.dart';
import '../../../profile/presentation/bloc/profile_bloc.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return Column(
          children: [
            SizedBox(
              height: AppValues.sizeHeight * 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Card(
                    elevation: 0.5,
                    color: AppColors.greySoft1,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(AppValues.radius * 28)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppValues.paddingWidth * 20,
                          vertical: AppValues.sizeHeight * 15),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_pin,
                            color: AppColors.blueDarK,
                          ),
                          SizedBox(
                            width: AppValues.sizeWidth * 8,
                          ),
                          Text(
                            AppStrings.locationDetail.tr(context),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          const Icon(
                            Icons.arrow_drop_down,
                            color: AppColors.blueDarK,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: (AppValues.radius * 26),
                      backgroundColor: AppColors.primary,
                      child: CircleAvatar(
                        radius: (AppValues.radius * 25),
                        backgroundColor: AppColors.white,
                        child: Icon(
                          Icons.notifications_outlined,
                          color: AppColors.blueDarK,
                          size: AppValues.font * 36,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: AppValues.sizeWidth * 12,
                    ),
                    state is UserLoadedState
                        ? ProfilePicture(
                            name: state.user.user.name,
                            radius: (AppValues.radius * 27),
                            fontsize: AppValues.font * 20,
                            count: 1,
                            img: state.user.user.logo == null ||
                                    state.user.user.logo.toString().isEmpty
                                ? null
                                : EndPoints.images + state.user.user.logo!,
                          )
                        : ShimmerLoader(
                            child: CircleAvatar(
                            radius: (AppValues.radius * 26),
                            backgroundColor: AppColors.greySoft2,
                            child: CircleAvatar(
                              radius: (AppValues.radius * 26),
                              backgroundColor: AppColors.white,
                            ),
                          )),
                  ],
                )
              ],
            ),
            SizedBox(
              height: AppValues.sizeHeight * 28,
            ),
            SizedBox(
              width: ScreenUtil().screenWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    children: [
                      Text(
                        AppStrings.hey.tr(context),
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontSize: AppValues.font * 23,
                                ),
                      ),
                      SizedBox(
                        width: AppValues.sizeWidth * 12,
                      ),
                      state is UserLoadedState
                          ? Text(
                              state.user.user.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      letterSpacing: 0.3,
                                      fontSize: AppValues.font * 23,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.blueLight),
                            )
                          : ShimmerLoader(
                              child: Text(
                                "...",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                        letterSpacing: 0.3,
                                        fontSize: AppValues.font * 23,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.blueLight),
                              ),
                            ),
                    ],
                  ),
                  SizedBox(
                    height: AppValues.sizeHeight * 20,
                  ),
                  Text(
                    AppStrings.letsStartExploring.tr(context),
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: AppValues.font * 23,
                        ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
