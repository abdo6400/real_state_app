import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owner/config/database/api/end_points.dart';
import 'package:owner/config/locale/app_localizations.dart';
import 'package:owner/features/profile/presentation/bloc/profile_bloc.dart';
import '../../../../core/components/default_components/default_loaders.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_values.dart';
import 'section_selection.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';

class ProfileTopSection extends StatelessWidget {
  const ProfileTopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        final bool isLoaded = state is UserLoadedState;
        return Column(
          children: [
            isLoaded
                ? state.user.user.logo != null
                    ? CircleAvatar(
                        radius: AppValues.radius * 60,
                        backgroundImage: NetworkImage(
                            EndPoints.images + state.user.user.logo!),
                      )
                    : ProfilePicture(
                        name: state.user.user.name,
                        radius: 31,
                        fontsize: 21,
                        random: true,
                      )
                : CircleAvatar(
                    radius: AppValues.radius * 60,
                    backgroundColor: AppColors.lightGrey,
                    child: Icon(
                      Icons.person_2_outlined,
                      size: AppValues.font * 30,
                      color: AppColors.blueDarK,
                    ),
                  ),
            SizedBox(
              height: AppValues.sizeHeight * 18,
            ),
            //name

            isLoaded
                ? Text(
                    state.user.user.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: AppValues.font * 20,
                        fontWeight: FontWeight.w500,
                        color: AppColors.blueDarK),
                  )
                : ShimmerLoader(
                    child: Text(
                      AppStrings.name.tr(context),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: AppValues.font * 20,
                          fontWeight: FontWeight.w500,
                          color: AppColors.blueDarK),
                    ),
                  ),

            SizedBox(
              height: AppValues.sizeHeight * 8,
            ),
            //email
            isLoaded
                ? Text(
                    state.user.user.email,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: AppValues.font * 20,
                        fontWeight: FontWeight.w500,
                        color: AppColors.greyMedi),
                  )
                : ShimmerLoader(
                    child: Text(
                      AppStrings.email.tr(context),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: AppValues.font * 20,
                          fontWeight: FontWeight.w500,
                          color: AppColors.greyMedi),
                    ),
                  ),

            SizedBox(
              height: AppValues.sizeHeight * 28,
            ),
            //e-states - trasnactions - reviews
            Row(
              children: [
                isLoaded
                    ? _CustomViewCard(
                        title: state.user.user.properties.length.toString(),
                        child: Text(
                          AppStrings.listings.tr(context),
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontSize: AppValues.font * 16,
                                  fontWeight: FontWeight.w300,
                                  color: AppColors.greyMedi),
                        ),
                      )
                    : Flexible(
                        child: ShimmerLoader(
                          width: double.infinity,
                          height: AppValues.sizeHeight * 100,
                          borderRadius: AppValues.radius * 24,
                        ),
                      ),
                SizedBox(
                  width: AppValues.sizeWidth * 12,
                ),
                isLoaded
                    ? _CustomViewCard(
                        title: "0",
                        child: Text(
                          AppStrings.transaction.tr(context),
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontSize: AppValues.font * 16,
                                  fontWeight: FontWeight.w300,
                                  color: AppColors.greyMedi),
                        ),
                      )
                    : Flexible(
                        child: ShimmerLoader(
                          width: double.infinity,
                          height: AppValues.sizeHeight * 100,
                          borderRadius: AppValues.radius * 24,
                        ),
                      ),
                SizedBox(
                  width: AppValues.sizeWidth * 12,
                ),
                isLoaded
                    ? _CustomViewCard(
                        title: "0",
                        child: Text(
                          AppStrings.reviews.tr(context),
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontSize: AppValues.font * 16,
                                  fontWeight: FontWeight.w300,
                                  color: AppColors.greyMedi),
                        ),
                      )
                    : Flexible(
                        child: ShimmerLoader(
                          width: double.infinity,
                          height: AppValues.sizeHeight * 100,
                          borderRadius: AppValues.radius * 24,
                        ),
                      )
              ],
            ),
            SizedBox(
              height: AppValues.sizeHeight * 28,
            ),
            const SectionSelection(),
            SizedBox(
              height: AppValues.sizeHeight * 20,
            ),
          ],
        );
      },
    );
  }
}

class _CustomViewCard extends StatelessWidget {
  final Widget child;
  final String title;
  const _CustomViewCard({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SizedBox(
          width: double.infinity,
          height: AppValues.sizeHeight * 100,
          child: Material(
            type: MaterialType.card,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppValues.radius * 24),
                side: const BorderSide(color: AppColors.greySoft2)),
            color: AppColors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: AppColors.blueDarK),
                ),
                SizedBox(
                  height: AppValues.sizeHeight * 4,
                ),
                child
              ],
            ),
          )),
    );
  }
}
