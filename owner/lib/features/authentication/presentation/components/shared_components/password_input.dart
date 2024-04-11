import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owner/config/locale/app_localizations.dart';
import '../../../../../core/components/default_components/default_form_field.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/custom_validation.dart';
import '../../bloc/cubit/information_cubit.dart';

class PasswordInput extends StatelessWidget {
  final TextEditingController controller;
  final TextEditingController? confirmPassword;
  final String title;
  const PasswordInput({
    super.key,
    required this.controller,
    required this.title,
    this.confirmPassword,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InformationCubit, InformationState>(
      listener: (context, state) {},
      builder: (context, state) {
        return DefaultTextFormField(
            controller: confirmPassword ?? controller,
            type: TextInputType.visiblePassword,
            validate: confirmPassword != null
                ? (value) =>
                    (value != null && value.compareTo(controller.text) == 0)
                        ? null
                        : AppStrings.pleaseEnterVaildConfirmPassword.tr(context)
                : (value) => CustomValidationHandler.isValidPassword(value!)
                    .translateWithNullSafetyString(context),
            prefix: Icons.lock_outline,
            isPassword: context.read<InformationCubit>().isVisiable,
            suffixPressed: () =>
                context.read<InformationCubit>().changeVisiablity(),
            suffix: context.read<InformationCubit>().isVisiable
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            label: title);
      },
    );
  }
}
