import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user/config/locale/app_localizations.dart';
import 'package:user/core/components/default_components/default_appbar.dart';
import 'package:user/core/utils/app_enums.dart';
import 'package:user/core/utils/app_values.dart';
import 'package:user/core/utils/commons.dart';
import '../../../../core/components/default_components/default_button.dart';
import '../../../../core/components/default_components/default_form_field.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/custom_validation.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});
  final TextEditingController oldPassword = TextEditingController();
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: const DefaultAppBar(
        addLang: false,
        addLeadingButton: true,
        appBarText: AppStrings.changePassword,
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: AppValues.paddingWidth * 15),
          child: Column(children: [
            SizedBox(
              height: AppValues.sizeHeight * 15,
            ),
            DefaultTextFormField(
                controller: oldPassword,
                type: TextInputType.visiblePassword,
                validate: (value) =>
                    CustomValidationHandler.isValidPassword(value!)
                        .translateWithNullSafetyString(context),
                label: AppStrings.enterOldPassword),
            SizedBox(
              height: AppValues.sizeHeight * 15,
            ),
            DefaultTextFormField(
                controller: newPassword,
                type: TextInputType.visiblePassword,
                validate: (value) =>
                    CustomValidationHandler.isValidPassword(value!)
                        .translateWithNullSafetyString(context),
                label: AppStrings.newPassword),
            SizedBox(
              height: AppValues.sizeHeight * 20,
            ),
            DefaultTextFormField(
                controller: confirmPassword,
                type: TextInputType.visiblePassword,
                validate: (value) =>
                    CustomValidationHandler.isValidPassword(value!)
                        .translateWithNullSafetyString(context),
                label: AppStrings.confirmPassword),
            DefaultButton(
              margin: EdgeInsets.symmetric(
                  horizontal: AppValues.marginWidth * 30,
                  vertical: AppValues.marginHeight * 10),
              onPressed: () {
                if (formKey.currentState!.validate()) {}
              },
              text: AppStrings.save,
            ),
          ]),
        ),
      ),
    ));
  }
}
