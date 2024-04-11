import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owner/config/locale/app_localizations.dart';
 
import '../../../../../core/components/default_components/default_button.dart';
import '../../../../../core/components/default_components/default_form_field.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_values.dart';
import '../../../../../core/utils/custom_validation.dart';
import '../../bloc/register/register_bloc.dart';

class RegisterInputSection extends StatefulWidget {
  const RegisterInputSection({super.key});

  @override
  State<RegisterInputSection> createState() => _RegisterInputSectionState();
}

class _RegisterInputSectionState extends State<RegisterInputSection> {
  final TextEditingController _email = TextEditingController();
  final _registerFormKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _registerFormKey,
      child: Column(
        children: [
          DefaultTextFormField(
              controller: _email,
              type: TextInputType.emailAddress,
              validate: (value) => CustomValidationHandler.isValidEmail(value!)
                  .translateWithNullSafetyString(context),
              prefix: Icons.email_outlined,
              label: AppStrings.email),
          SizedBox(
            height: AppValues.sizeHeight * 24,
          ),
          DefaultButton(
            height: AppValues.sizeHeight * 60,
            margin:
                EdgeInsets.symmetric(horizontal: AppValues.marginWidth * 45),
            onPressed: () {
              if (_registerFormKey.currentState!.validate()) {
                BlocProvider.of<RegisterBloc>(context)
                    .add(CheckEmailEvent(true, emailOrPhone: _email.text));
              }
            },
            text: AppStrings.signUp,
          ),
        ],
      ),
    );
  }
}
