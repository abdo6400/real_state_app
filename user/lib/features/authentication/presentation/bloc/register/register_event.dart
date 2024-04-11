part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class CheckEmailEvent extends RegisterEvent {
  final String emailOrPhone;
  final bool isEmail;
  const CheckEmailEvent(this.isEmail, {required this.emailOrPhone});
}

class ResendCodeEvent extends RegisterEvent {
  final String emailOrPhone;

  const ResendCodeEvent({required this.emailOrPhone});
}

class VerfiyEmailEvent extends RegisterEvent {
  final String code;
  final String secureKey;
  final String email;
  const VerfiyEmailEvent({
    required this.code,
    required this.secureKey,
    required this.email,
  });
}

class SignUpEvent extends RegisterEvent {
  final XFile? image;
  final String name;
  final String phone;
  final String email;
  final String password;
  final String confirmPassword;

  const SignUpEvent({
    this.image,
    required this.name,
    required this.confirmPassword,
    required this.phone,
    required this.email,
    required this.password,
  });
}
