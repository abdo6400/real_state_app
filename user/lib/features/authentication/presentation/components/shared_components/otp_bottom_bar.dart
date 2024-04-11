import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user/config/locale/app_localizations.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_values.dart';
import '../../bloc/timer/timer_cubit.dart';

class OtpBottomBar extends StatefulWidget {
  final String email;
  final Function function;
  const OtpBottomBar({super.key, required this.email, required this.function});

  @override
  State<OtpBottomBar> createState() => _OtpBottomBarState();
}

class _OtpBottomBarState extends State<OtpBottomBar> {
  @override
  void dispose() {
    context.read<WorkoutCubit>().closeTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: AppValues.sizeHeight * 190,
        ),
        Card(
          elevation: 0,
          color: AppColors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppValues.radius * 100)),
          margin: EdgeInsets.symmetric(horizontal: AppValues.marginWidth * 80),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppValues.paddingWidth * 20,
                vertical: AppValues.paddingHeight * 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.timer_outlined,
                  color: AppColors.blueLight,
                ),
                SizedBox(
                  width: AppValues.sizeWidth * 12,
                ),
                BlocBuilder<WorkoutCubit, TimerState>(
                    builder: (context, state) {
                  if (state is WorkoutInitial) {
                    return Text(
                      AppStrings.codeExpired.tr(context).toString(),
                      style: Theme.of(context).textTheme.titleSmall,
                    );
                  }

                  if (state is WorkoutInProgress) {
                    return Text(
                      state.elapsed.toString(),
                      style: Theme.of(context).textTheme.titleSmall,
                    );
                  }

                  return Container();
                })
              ],
            ),
          ),
        ),
        SizedBox(
          height: AppValues.sizeHeight * 40,
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(AppStrings.didNotReciveCode.tr(context),
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontSize: AppValues.font * 14,
                      fontWeight: FontWeight.bold)),
              BlocBuilder<WorkoutCubit, TimerState>(
                builder: (context, state) {
                  return TextButton(
                    onPressed: state is WorkoutInProgress
                        ? null
                        : () {
                            widget.function();
                          },
                    child: Column(
                      children: [
                        Text(AppStrings.resendCodeTo.tr(context),
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                                    color: state is WorkoutInProgress
                                        ? AppColors.hintColor
                                        : AppColors.primary,
                                    fontSize: AppValues.font * 14,
                                    fontWeight: FontWeight.bold)),
                        Text(widget.email,
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                                    color: state is WorkoutInProgress
                                        ? AppColors.hintColor
                                        : AppColors.primary,
                                    fontSize: AppValues.font * 14,
                                    fontWeight: FontWeight.bold)),
                      ],
                    ),
                  );
                },
              )
            ])
      ],
    );
  }
}
