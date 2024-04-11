import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owner/config/locale/app_localizations.dart';
import 'package:owner/core/utils/commons.dart';
import '../../../../../config/routes/app_routes.dart';
import '../../../../../core/components/default_components/default_button.dart';
import '../../../../../core/components/default_components/default_form_field.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_values.dart';
import '../../../../../core/utils/custom_validation.dart';
import '../../bloc/cubit/information_cubit.dart';
import '../../bloc/login/login_bloc.dart';

class LoginInputSection extends StatefulWidget {
  const LoginInputSection({super.key});

  @override
  State<LoginInputSection> createState() => _LoginInputSectionState();
}

class _LoginInputSectionState extends State<LoginInputSection> {
  final TextEditingController _password = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final _loginFormKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _password.dispose();
    _email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<InformationCubit>();
    return Form(
      key: _loginFormKey,
      child: Column(
        children: [
          DefaultTextFormField(
              controller: _email,
              type: TextInputType.emailAddress,
              validate: (value) => CustomValidationHandler.isValidEmail(value!)
                  !.translateWithNullSafetyString(context),
              prefix: Icons.email_outlined,
              label: AppStrings.email),
          SizedBox(
            height: AppValues.sizeHeight * 24,
          ),
          DefaultTextFormField(
              controller: _password,
              type: TextInputType.visiblePassword,
              prefix: Icons.lock_outline,
              validate: (value) =>
                  CustomValidationHandler.isValidPassword(value!)
                      .translateWithNullSafetyString(context),
              isPassword: context.watch<InformationCubit>().isVisiable,
              label: AppStrings.password),
          SizedBox(
            height: AppValues.sizeHeight * 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  context.navigateTo(screenRoute: Routes.forgetPasswordRoute);
                },
                child: Text(
                  AppStrings.forgetPassword.tr(context),
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: AppColors.blueLight),
                ),
              ),
              GestureDetector(
                onTap: () => cubit.changeVisiablity(),
                child: Text(
                  context.watch<InformationCubit>().isVisiable
                      ? AppStrings.showPassword.tr(context)
                      : AppStrings.hidePassword.tr(context),
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: AppColors.blueLight),
                ),
              ),
            ],
          ),
          SizedBox(
            height: AppValues.sizeHeight * 36,
          ),
          DefaultButton(
            height: AppValues.sizeHeight * 60,
            margin:
                EdgeInsets.symmetric(horizontal: AppValues.marginWidth * 45),
            onPressed: () {
              if (_loginFormKey.currentState!.validate()) {
                context.read<LoginBloc>().add(
                    SignInEvent(email: _email.text, password: _password.text));
              }
            },
            text: AppStrings.login,
          ),
        ],
      ),
    );
  }
}
