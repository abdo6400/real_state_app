import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../data/models/register_params_model.dart';
import '../../../domain/entities/auth.dart';
import '../../../domain/usecases/register_usecases/check_email_usecase.dart';
import '../../../domain/usecases/register_usecases/register_usecase.dart';
import '../../../domain/usecases/register_usecases/resend_code_usecase.dart';
import '../../../domain/usecases/register_usecases/verfiy_email_usecase.dart';
import 'package:image_picker/image_picker.dart';
part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final CheckEmailUseCase _checkEmailUseCase;
  final VerfiyEmailUseCase _verfiyEmailUseCase;
  final ResendCodeUseCase _resendCodeUseCase;
  final RegisterUseCase _registerUseCase;
  // final RegisterWithGoogleUseCase _registerWithGoogleUseCase;
  RegisterBloc(
    this._checkEmailUseCase,
    this._verfiyEmailUseCase,
    this._resendCodeUseCase,
    this._registerUseCase,
  ) : super(RegisterInitial()) {
    on<CheckEmailEvent>(onCheckEmailEvent);
    on<ResendCodeEvent>(onResendCodeEvent);
    on<VerfiyEmailEvent>(onVerfiyEmailEvent);
    on<SignUpEvent>(onSignUpEvent);
  }

  void onCheckEmailEvent(
      CheckEmailEvent event, Emitter<RegisterState> emit) async {
    emit(RegisterLoadingState());
    emit(await _checkEmailUseCase(event.emailOrPhone).then((value) =>
        value.fold(
            (l) => RegisterErrorState(message: l.errorMessage),
            (r) => CheckEmailLoadedState(
                secureKey: r.token, email: event.emailOrPhone))));
  }

  void onResendCodeEvent(
      ResendCodeEvent event, Emitter<RegisterState> emit) async {
    emit(RegisterLoadingState());
    emit(await _resendCodeUseCase(event.emailOrPhone).then((value) =>
        value.fold(
            (l) => RegisterErrorState(message: l.errorMessage),
            (r) => ResendCodeLoadedState(
                message: r.message, secureKey: r.token))));
  }

  void onVerfiyEmailEvent(
      VerfiyEmailEvent event, Emitter<RegisterState> emit) async {
    emit(RegisterLoadingState());
    emit(await _verfiyEmailUseCase(
            VerifyParams(code: event.code, secureKey: event.secureKey))
        .then((value) => value.fold(
                (l) => RegisterErrorState(message: l.errorMessage), (r) async {
              return VerifyEmailLoadedState(
                  message: r.message, email: event.email);
            })));
  }

  void onSignUpEvent(SignUpEvent event, Emitter<RegisterState> emit) async {
    emit(RegisterLoadingState());
    emit(await _registerUseCase(RegisterParamsModel(
      email: event.email,
      name: event.name,
      password: event.password,
      image: event.image,
      phone: event.phone,
    )).then((value) => value.fold(
        (l) => RegisterErrorState(message: l.errorMessage),
        (r) => SignUpLoadedState(auth: r))));
  }
}
