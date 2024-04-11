import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/components/default_components/default_button.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_values.dart';
import '../../bloc/forget_password/forget_password_bloc.dart';
import '../shared_components/password_input.dart';

class ResetPasswordInputSection extends StatefulWidget {
  final String email;
  const ResetPasswordInputSection({super.key, required this.email});

  @override
  State<ResetPasswordInputSection> createState() =>
      _ResetPasswordInputSectionState();
}

class _ResetPasswordInputSectionState extends State<ResetPasswordInputSection> {
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final _resetFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _password.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _resetFormKey,
        child: Column(
          children: [
            SizedBox(
              height: AppValues.sizeHeight * 40,
            ),
            PasswordInput(
              controller: _password,
              title: AppStrings.password,
              confirmPassword: null,
            ),
            PasswordInput(
              controller: _password,
              title: AppStrings.confirmPassword,
              confirmPassword: _confirmPassword,
            ),
            SizedBox(
              height: AppValues.sizeHeight * 40,
            ),
            DefaultButton(
              height: AppValues.sizeHeight * 60,
              fontSize: AppValues.font * 22,
              radius: AppValues.font * 20,
              elevation: 0.5,
              margin: EdgeInsets.symmetric(
                horizontal: AppValues.marginWidth * 80,
              ),
              onPressed: () {
                if (_resetFormKey.currentState!.validate()) {
                  context.read<ForgetPasswordBloc>().add(ResetPasswordEvent(
                      email: widget.email,
                      newPassword: _password.text,
                      confirmPassword: _confirmPassword.text));
                }
              },
              text: AppStrings.signIn,
            ),
          ],
        ));
  }
}
