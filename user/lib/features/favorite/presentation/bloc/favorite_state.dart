part of 'favorite_bloc.dart';

sealed class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

final class FavoriteInitial extends FavoriteState {}

class FavoriteDataLoadingState extends FavoriteState {}

class FavoriteEditDataLoadingState extends FavoriteState {}

class FavoriteDataErrorState extends FavoriteState {
  final String message;

  const FavoriteDataErrorState({required this.message});
}

class FavoriteDataLoadedState extends FavoriteState {
  final List<Property> properties;

  const FavoriteDataLoadedState({required this.properties});
}
