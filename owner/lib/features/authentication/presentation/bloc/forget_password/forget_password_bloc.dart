import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/usecases/forget_password_usecases/forget_password_usecase.dart';
import '../../../domain/usecases/forget_password_usecases/forget_resend_code_usecase.dart';
import '../../../domain/usecases/forget_password_usecases/forget_verify_email_usecase.dart';
import '../../../domain/usecases/forget_password_usecases/reset_password_usecase.dart';

part 'forget_password_event.dart';
part 'forget_password_state.dart';

class ForgetPasswordBloc
    extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  final ForgetPasswordUseCase _forgetPasswordUseCase;
  final ResetPasswordUseCase _resetPasswordUseCase;
  final ForgetPasswordVerifyEmailUseCase _forgetPasswordVerifyEmailUseCase;
  final ForgetPasswordResendCodeUseCase _forgetPasswordResendCodeUseCase;
  ForgetPasswordBloc(
      this._forgetPasswordUseCase,
      this._resetPasswordUseCase,
      this._forgetPasswordVerifyEmailUseCase,
      this._forgetPasswordResendCodeUseCase)
      : super(ForgetPasswordInitial()) {
    on<ForgetPasswordEvent>((event, emit) {
      on<ForgetPasswordCheckEmailEvent>(onCheckEmailEvent);
      on<ForgetPasswordResendCodeEvent>(onResendCodeEvent);
      on<ForgetPasswordVerfiyEmailEvent>(onVerfiyEmailEvent);
      on<ResetPasswordEvent>(onResetEmailEvent);
    });
  }
  void onCheckEmailEvent(ForgetPasswordCheckEmailEvent event,
      Emitter<ForgetPasswordState> emit) async {
    emit(ForgetPasswordLoadingState());
    emit(await _forgetPasswordUseCase(event.email).then((value) =>
        value.fold(
            (l) => ForgetPasswordErrorState(message: l.errorMessage),
            (r) => ForgetPasswordCheckEmailLoadedState(
                secureKey: r.token, email: event.email))));
  }

  void onResendCodeEvent(ForgetPasswordResendCodeEvent event,
      Emitter<ForgetPasswordState> emit) async {
    emit(ForgetPasswordLoadingState());
    emit(await _forgetPasswordResendCodeUseCase(event.emailOrPhone).then(
        (value) => value.fold(
            (l) => ForgetPasswordErrorState(message: l.errorMessage),
            (r) => ForgetPasswordResendCodeLoadedState(
                message: r.message, secureKey: r.token))));
  }

  void onVerfiyEmailEvent(ForgetPasswordVerfiyEmailEvent event,
      Emitter<ForgetPasswordState> emit) async {
    emit(ForgetPasswordLoadingState());
    emit(await _forgetPasswordVerifyEmailUseCase(
            ForgetVerifyParams(code: event.code, secureKey: event.secureKey))
        .then((value) => value
                .fold((l) => ForgetPasswordErrorState(message: l.errorMessage),
                    (r) async {
              return ForgetPasswordVerifyEmailLoadedState(
                  message: r.message, email: event.email);
            })));
  }

  void onResetEmailEvent(
      ResetPasswordEvent event, Emitter<ForgetPasswordState> emit) async {
    emit(ForgetPasswordLoadingState());
    emit(await _resetPasswordUseCase(ResetPasswordParams(
            newPassword: event.newPassword,
            email: event.email,
            confirmNewPassword: event.confirmPassword))
        .then((value) => value.fold(
            (l) => ForgetPasswordErrorState(message: l.errorMessage),
            (r) => ResetPasswordLoadedState(message: r.message))));
  }
}
