part of 'nearby_locations_bloc.dart';

sealed class NearbyLocationsEvent extends Equatable {
  const NearbyLocationsEvent();

  @override
  List<Object> get props => [];
}

class GetNearbyLocationsEvent extends NearbyLocationsEvent {
  final List<double> location;

  const GetNearbyLocationsEvent({required this.location});
}
