part of 'top_owners_bloc.dart';

sealed class TopOwnersState extends Equatable {
  const TopOwnersState();
  
  @override
  List<Object> get props => [];
}

final class TopOwnersInitial extends TopOwnersState {}

class GetTopOwnersLoadingState extends TopOwnersState {}

class GetTopOwnersLoadedState extends TopOwnersState {
  final List<Owner> owners;

  const GetTopOwnersLoadedState({required this.owners});
}

class GetTopOwnersErrorState extends TopOwnersState {
  final String message;

  const GetTopOwnersErrorState({required this.message});
}

