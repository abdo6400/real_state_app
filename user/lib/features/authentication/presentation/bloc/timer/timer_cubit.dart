import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'timer_state.dart';

class WorkoutCubit extends Cubit<TimerState> {
  WorkoutCubit() : super(const WorkoutInitial());

  Timer? _timer;
  onTick(Timer timer) {
    if (state is WorkoutInProgress) {
      if (state.elapsed! > 0) {
        emit(WorkoutInProgress(state.elapsed! - 1));
      } else {
        closeTimer();
      }
    }
  }

  Future<void> startWorkout([int? index]) async {
    emit(const WorkoutInProgress(120));
    _timer = Timer.periodic(const Duration(seconds: 1), onTick);
  }

  closeTimer() {
    if (_timer != null) {
      _timer!.cancel();
      emit(const WorkoutInitial());
    }
  }
}
