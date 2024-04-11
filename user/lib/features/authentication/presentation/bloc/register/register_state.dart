part of 'register_bloc.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

final class RegisterInitial extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterErrorState extends RegisterState {
  final String message;

  const RegisterErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

class CheckEmailLoadedState extends RegisterState {
  final String secureKey;
  final String email;
  const CheckEmailLoadedState({required this.secureKey, required this.email});
  @override
  List<Object> get props => [secureKey, email];
}

class ResendCodeLoadedState extends RegisterState {
  final String message;
  final String secureKey;
  const ResendCodeLoadedState({required this.message, required this.secureKey});

  @override
  List<Object> get props => [message];
}

class VerifyEmailLoadedState extends RegisterState {
  final String message;
final String email;
  const VerifyEmailLoadedState( {required this.message,required this.email,});

  @override
  List<Object> get props => [message];
}

class SignUpLoadedState extends RegisterState {
  final Auth auth;

  const SignUpLoadedState({required this.auth});

  @override
  List<Object> get props => [auth];
}
