part of 'timer_cubit.dart';

abstract class TimerState extends Equatable {
  final int? elapsed;
  const TimerState(this.elapsed);
}

class WorkoutInitial extends TimerState {
  const WorkoutInitial() : super(0);

  @override
  List<Object?> get props => [];
}

class WorkoutInProgress extends TimerState {
  const WorkoutInProgress(super.elapsed);

  @override
  List<Object?> get props => [elapsed];
}
