import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owner/core/utils/commons.dart';
import '../../../../../config/routes/app_routes.dart';
import '../../../../../core/components/default_components/default_appbar.dart';
import '../../../../../core/utils/app_enums.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_values.dart';
import '../../bloc/register/register_bloc.dart';
import '../../components/register_components/register_input_section.dart';
import '../../components/shared_components/bottombar.dart';
import '../../components/shared_components/topbar.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          context.showLoader();
        } else if (state is RegisterErrorState) {
          context.hideLoader();
          context.showInfoDialog(state.message, AlertDialogType.error);
        } else if (state is SignUpLoadedState) {
          context.hideLoader();
          saveToken(state.auth.token).then((value) => context
              .showSuccessDialogToast(
                  icon: AppImages.success,
                  duration: const Duration(milliseconds: 2000),
                  message: AppStrings.successfullyRegistered)
              .then((value) =>
                  context.navigateAndFinishAll(screenRoute: Routes.mainRoute)));
        } else if (state is CheckEmailLoadedState) {
          context.hideLoader();
          context
              .showSuccessDialogToast(
                  icon: AppImages.emailSent,
                  duration: const Duration(milliseconds: 2000),
                  title: AppStrings.checkYourEmail,
                  message: AppStrings.checkYourEmailMessage)
              .then((value) {
            context.navigateTo(
                screenRoute: Routes.otpRegisterRoute,
                arg: {"secureKey": state.secureKey, "email": state.email});
          });
        } else if (state is VerifyEmailLoadedState) {
          context.hideLoader();
          context
              .showSuccessDialogToast(
                  icon: AppImages.vaild,
                  duration: const Duration(milliseconds: 1000),
                  message: state.message)
              .then((value) => context.navigateAndFinish(
                  screenRoute: Routes.informationRoute, arg: state.email));
        }
      },
      child: Scaffold(
        appBar: const DefaultAppBar(
          addLang: true,
          addLeadingButton: false,
        ),
        body: ListView(
            padding:
                EdgeInsets.symmetric(horizontal: AppValues.paddingWidth * 22),
            children: [
              const TopBar(
                  title: AppStrings.createAccount,
                  subTitle: AppStrings.reigsterSubTitle),
              SizedBox(
                height: AppValues.sizeHeight * 30,
              ),
              const RegisterInputSection(),
              SizedBox(
                height: AppValues.sizeHeight * 30,
              ),
              BottomBar(
                firstTitle: AppStrings.haveAnAccount,
                secondTitle: AppStrings.login,
                function: () {
                  context.navigateAndFinish(screenRoute: Routes.loginRoute);
                },
              )
            ]),
      ),
    ));
  }
}
