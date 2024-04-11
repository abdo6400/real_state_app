part of 'forget_password_bloc.dart';

sealed class ForgetPasswordEvent extends Equatable {
  const ForgetPasswordEvent();

  @override
  List<Object> get props => [];
}

class ForgetPasswordCheckEmailEvent extends ForgetPasswordEvent {
  final String email;

  const ForgetPasswordCheckEmailEvent({required this.email});
}

class ForgetPasswordResendCodeEvent extends ForgetPasswordEvent {
  final String emailOrPhone;

  const ForgetPasswordResendCodeEvent({required this.emailOrPhone});
}

class ForgetPasswordVerfiyEmailEvent extends ForgetPasswordEvent {
  final String code;
  final String secureKey;
  final String email;
  const ForgetPasswordVerfiyEmailEvent({
    required this.code,
    required this.secureKey,
    required this.email,
  });
}

class ResetPasswordEvent extends ForgetPasswordEvent {
  final String newPassword;
  final String confirmPassword;
  final String email;
  const ResetPasswordEvent(
      {
        required this.email,
      required this.newPassword,
      required this.confirmPassword});
}
