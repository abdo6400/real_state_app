import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/auth.dart';
import '../../../domain/usecases/login_usecases/login_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase _loginUseCase;
  LoginBloc(this._loginUseCase) : super(LoginInitial()) {
    on<SignInEvent>(onSignInEvent);
  }

  void onSignInEvent(SignInEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoadingState());
    emit(await _loginUseCase(
            LoginParams(password: event.password, email: event.email))
        .then((value) => value.fold(
            (l) => LoginErrorState(message: l.errorMessage),
            (auth) => LoginLoadedState(auth: auth))));
  }
}
