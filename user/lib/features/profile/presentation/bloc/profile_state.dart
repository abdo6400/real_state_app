part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class UserLoadingState extends ProfileState {}

class UserLoadedState extends ProfileState {
  final User user;

  const UserLoadedState({required this.user});
}

class UserErrorState extends ProfileState {
  final String message;

  const UserErrorState({required this.message});
}
