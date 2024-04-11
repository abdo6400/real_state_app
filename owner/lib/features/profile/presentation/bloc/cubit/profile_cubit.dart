import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  int selectedViewIndex = 0;
  int selectedSection = 0;

  void changeSelectedSection(int index) {
    emit(IndexInitial());
    selectedSection = index;
    emit(IndexChanged());
  }
}
