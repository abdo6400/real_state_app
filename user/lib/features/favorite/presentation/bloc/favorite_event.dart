part of 'favorite_bloc.dart';

sealed class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class GetFavoriteEvent extends FavoriteEvent {}

class EditFavoriteEvent extends FavoriteEvent {
  final String id;
 

  const EditFavoriteEvent({required this.id});
}
