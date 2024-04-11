part of 'nearby_locations_bloc.dart';

sealed class NearbyLocationsState extends Equatable {
  const NearbyLocationsState();

  @override
  List<Object> get props => [];
}

final class NearbyLocationsInitial extends NearbyLocationsState {}

class GetNearbyLocationsLoadingState extends NearbyLocationsState {}

class GetNearbyLocationsLoadedState extends NearbyLocationsState {
  final List<Property> properties;

  const GetNearbyLocationsLoadedState({required this.properties});
}

class GetNearbyLocationsErrorState extends NearbyLocationsState {
  final String message;

  const GetNearbyLocationsErrorState({required this.message});
}
