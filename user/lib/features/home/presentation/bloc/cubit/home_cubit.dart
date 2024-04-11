import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  int index = 0;

  void changeIndex(int index) {
    emit(TypeInitial());
    this.index = index;
    emit(TypeChanged());
  }
}
