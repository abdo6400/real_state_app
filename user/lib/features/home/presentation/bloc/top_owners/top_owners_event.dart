part of 'top_owners_bloc.dart';

sealed class TopOwnersEvent extends Equatable {
  const TopOwnersEvent();

  @override
  List<Object> get props => [];
}

class GetTopOwnersEvent extends TopOwnersEvent {}
