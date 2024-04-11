import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owner/core/utils/commons.dart';

import '../../../../../core/components/default_components/default_appbar.dart';
import '../../../../../core/utils/app_enums.dart';
import '../../../../../core/utils/app_values.dart';
import '../../bloc/register/register_bloc.dart';
import '../../bloc/timer/timer_cubit.dart';
import '../../components/shared_components/otp_bottom_bar.dart';
import '../../components/shared_components/otp_input_section.dart';
import '../../components/shared_components/otp_top_section.dart';

class OtpRegisterScreen extends StatelessWidget {
  const OtpRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)?.settings.arguments as Map;
    String secureKey = data["secureKey"];
    String email = data["email"];
    return Scaffold(
        appBar: const DefaultAppBar(
          addLang: true,
          addLeadingButton: true,
        ),
        body: ListView(
          padding:
              EdgeInsets.symmetric(horizontal: AppValues.paddingWidth * 20),
          children: [
            OtpTopSection(
              email: email,
            ),
            BlocConsumer<RegisterBloc, RegisterState>(
              listener: (context, state) {
                if (state is ResendCodeLoadedState) {
                  context.hideLoader();
                  context.showToastMsg(
                      msg: state.message, toastState: ToastStates.success);
                  secureKey = state.secureKey;
                  context.read<WorkoutCubit>().startWorkout();
                }
              },
              buildWhen: (previous, current) =>
                  current is ResendCodeLoadedState,
              builder: (context, state) {
                return OtpInputSection(
                  secureKey: secureKey,
                  email: email,
                  function: (value) => context.read<RegisterBloc>().add(
                      VerfiyEmailEvent(
                          code: value, secureKey: secureKey, email: email)),
                );
              },
            ),
            SizedBox(
              height: AppValues.sizeHeight * 80,
            ),
            OtpBottomBar(
              email: email,
              function: () => context
                  .read<RegisterBloc>()
                  .add(ResendCodeEvent(emailOrPhone: email)),
            )
          ],
        ));
  }
}
