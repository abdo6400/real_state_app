import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:owner/core/bloc/usecases/usecase.dart';

import '../../domain/entities/user.dart';
import '../../domain/usecases/get_user_usecase.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetUserUseCase _getUserUseCase;
  ProfileBloc(this._getUserUseCase) : super(ProfileInitial()) {
    on<GetUserEvent>(onGetUserEvent);
  }
  void onGetUserEvent(GetUserEvent event, emit) async {
    emit(UserLoadingState());
    emit(await _getUserUseCase(NoParams()).then((value) => value.fold(
        (l) => UserErrorState(message: l.errorMessage),
        (user) => UserLoadedState(user: user))));
  }
}
