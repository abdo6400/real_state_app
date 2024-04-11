part of 'top_locations_bloc.dart';

sealed class TopLocationsEvent extends Equatable {
  const TopLocationsEvent();

  @override
  List<Object> get props => [];
}

class GetTopLocationsEvent extends TopLocationsEvent {}
