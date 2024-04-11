import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user/config/locale/app_localizations.dart';
import 'package:user/core/components/default_components/default_error_card.dart';
import 'package:user/core/components/default_components/default_loading_indicator.dart';
import 'package:user/core/utils/app_values.dart';
import '../../../../core/components/default_components/default_appbar.dart';
import '../../../../core/components/default_components/default_button.dart';
import '../../../../core/components/default_components/default_form_field.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/custom_validation.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: const DefaultAppBar(
        addLang: false,
        addLeadingButton: true,
        appBarText: AppStrings.profile,
      ), /*
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          final cubit = context.read<UserCubit>();
          if (state is UserLoadingState) {
            return const DefaultLoadingIndicator();
          } else if (state is UserErrortate) {
            return DefaultErrorCard(
                erroMessage: state.msg,
                function: () {},
                title: AppStrings.someThingWentWrong);
          } else if (state is UserLoadedState) {
            return Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: AppValues.paddingWidth * 15),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: AppValues.sizeHeight * 40,
                    ),
                    CircleAvatar(
                      radius: AppValues.radius * 50,
                      backgroundColor: AppColors.grey.withOpacity(0.5),
                      child: CircleAvatar(
                        backgroundColor: AppColors.lightGrey,
                        radius: AppValues.radius * 60,
                        child: Text(
                          state.user.user.name[0].toUpperCase(),
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: AppValues.sizeHeight * 25,
                    ),
                    DefaultTextFormField(
                        controller: null,
                        type: TextInputType.emailAddress,
                        suffix: Icons.email,
                        readOnly: true,
                        backgroundColor: AppColors.primary,
                        textColor: AppColors.white,
                        hint: state.user.user.email),
                    SizedBox(
                      height: AppValues.sizeHeight * 15,
                    ),
                    DefaultTextFormField(
                        controller: cubit.name,
                        suffix: Icons.person,
                        type: TextInputType.name,
                        label: AppStrings.name),
                    SizedBox(
                      height: AppValues.sizeHeight * 15,
                    ),
                    DefaultTextFormField(
                        controller: cubit.phone,
                        suffix: Icons.phone_android,
                        validate: (value) =>
                            CustomValidationHandler.isValidPhoneNumber(value!)
                                .translateWithNullSafetyString(context),
                        type: TextInputType.phone,
                        label: AppStrings.phoneNumber),
                    SizedBox(
                      height: AppValues.sizeHeight * 15,
                    ),
                    DefaultButton(
                      margin: EdgeInsets.symmetric(
                          horizontal: AppValues.marginWidth * 30,
                          vertical: AppValues.marginHeight * 10),
                      onPressed: () {
                        if (cubit.phone.text.compareTo(state.user.user.phone) !=
                                0 ||
                            cubit.name.text.compareTo(state.user.user.name) !=
                                0) {
                          cubit.editUser();
                        }
                      },
                      text: AppStrings.save,
                    ),
                  ],
                ),
              ),
            );
          }
          return const DefaultLoadingIndicator();
        },
      ),*/
    ));
  }
}
