import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user/core/utils/app_values.dart';
import 'package:user/core/utils/commons.dart';
import '../../../../../config/routes/app_routes.dart';
import '../../../../../core/components/default_components/default_appbar.dart';
import '../../../../../core/utils/app_enums.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../bloc/forget_password/forget_password_bloc.dart';
import '../../components/forget_components/forget_input_section.dart';
import '../../components/shared_components/topbar.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPasswordBloc, ForgetPasswordState>(
        listener: (context, state) {
          if (state is ForgetPasswordLoadingState) {
            context.showLoader();
          } else if (state is ForgetPasswordErrorState) {
            context.hideLoader();
            context.showInfoDialog(state.message, AlertDialogType.error);
          } else if (state is ForgetPasswordCheckEmailLoadedState) {
            context.hideLoader();
            context
                .showSuccessDialogToast(
                    icon: AppImages.emailSent,
                    duration: const Duration(milliseconds: 2000),
                    title: AppStrings.checkYourEmail,
                    message: AppStrings.checkYourEmailMessage)
                .then((value) async {
              context.navigateTo(
                  screenRoute: Routes.otpForgetPasswordRoute,
                  arg: {"secureKey": state.secureKey, "email": state.email});
            });
          } else if (state is ForgetPasswordVerifyEmailLoadedState) {
            context.hideLoader();
            context
                .showSuccessDialogToast(
                    icon: AppImages.vaild,
                    duration: const Duration(milliseconds: 2000),
                    message: state.message)
                .then((value) {
              context.navigateAndFinish(
                  screenRoute: Routes.resetPasswordRoute, arg: state.email);
            });
          } else if (state is ResetPasswordLoadedState) {
            context.hideLoader();
            context
                .showSuccessDialogToast(
                    icon: AppImages.success,
                    duration: const Duration(milliseconds: 2000),
                    message: state.message)
                .then((value) => context.navigateAndFinishAll(
                    screenRoute: Routes.loginRoute));
          }
        },
        child: Scaffold(
          appBar: const DefaultAppBar(
            addLang: true,
            addLeadingButton: true,
          ),
          body: ListView(
            padding:
                EdgeInsets.symmetric(horizontal: AppValues.paddingWidth * 20),
            children: [
              SizedBox(
                height: AppValues.sizeHeight * 20,
              ),
              const TopBar(
                  title: AppStrings.forgetPassword,
                  subTitle: AppStrings.enterEmailThat),
              SizedBox(
                height: AppValues.sizeHeight * 20,
              ),
              const ForgetInputSection()
            ],
          ),
        ));
  }
}
