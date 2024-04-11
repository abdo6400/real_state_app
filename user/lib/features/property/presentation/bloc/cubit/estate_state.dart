part of 'estate_cubit.dart';

abstract class EstateState extends Equatable {
  const EstateState();

  @override
  List<Object> get props => [];
}

class EstateInitial extends EstateState {}

class EstateChangeDetailsView extends EstateState {}

class EstateChangedDetailsView extends EstateState {}

class BookLoadingState extends EstateState {}

class BookLoadedState extends EstateState {
  final String msg;

  const BookLoadedState(this.msg);
}

class BookErrorState extends EstateState {
  final String msg;

  const BookErrorState(this.msg);
}
