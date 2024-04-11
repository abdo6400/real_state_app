import 'package:flutter/material.dart';
import '../../../../../core/components/default_components/default_appbar.dart';
import '../../../../../core/utils/app_values.dart';
import '../../components/forget_components/forget_top_Section.dart';
import '../../components/forget_components/reset_password_input_section.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String email = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: const DefaultAppBar(
        addLang: true,
        addLeadingButton: true,
      ),
      body: ListView(
        padding:
                EdgeInsets.symmetric(horizontal: AppValues.paddingWidth * 20),
        children: [
        ForgetTopSection(
          eamil: email,
        ),
        ResetPasswordInputSection(
          email: email,
        )
      ]),
    );
  }
}
