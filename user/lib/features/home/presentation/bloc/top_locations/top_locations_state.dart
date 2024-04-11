part of 'top_locations_bloc.dart';

sealed class TopLocationsState extends Equatable {
  const TopLocationsState();
  
  @override
  List<Object> get props => [];
}

final class TopLocationsInitial extends TopLocationsState {}


class GetTopLocationsLoadingState extends TopLocationsState {}

class GetTopLocationsLoadedState extends TopLocationsState {
  final List<Property> properties;

  const GetTopLocationsLoadedState({required this.properties});
}

class GetTopLocationsErrorState extends TopLocationsState {
  final String message;

  const GetTopLocationsErrorState({required this.message});
}

