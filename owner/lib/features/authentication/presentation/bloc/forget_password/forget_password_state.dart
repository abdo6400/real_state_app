part of 'forget_password_bloc.dart';

sealed class ForgetPasswordState extends Equatable {
  const ForgetPasswordState();

  @override
  List<Object> get props => [];
}

final class ForgetPasswordInitial extends ForgetPasswordState {}

class ForgetPasswordLoadingState extends ForgetPasswordState {}

class ForgetPasswordErrorState extends ForgetPasswordState {
  final String message;

  const ForgetPasswordErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

class ForgetPasswordResendCodeLoadedState extends ForgetPasswordState {
  final String message;
  final String secureKey;
  const ForgetPasswordResendCodeLoadedState(
      {required this.message, required this.secureKey});

  @override
  List<Object> get props => [message];
}

class ForgetPasswordCheckEmailLoadedState extends ForgetPasswordState {
  final String secureKey;
 final String email;
  const ForgetPasswordCheckEmailLoadedState( {required this.email,required this.secureKey});
  @override
  List<Object> get props => [secureKey];
}

class ForgetPasswordVerifyEmailLoadedState extends ForgetPasswordState {
  final String message;
  final String email;
  const ForgetPasswordVerifyEmailLoadedState({
    required this.message,
    required this.email,
  });

  @override
  List<Object> get props => [message];
}

class ResetPasswordLoadedState extends ForgetPasswordState {
  final String message;

  const ResetPasswordLoadedState({required this.message});

  @override
  List<Object> get props => [message];
}
