part of 'information_cubit.dart';

sealed class InformationState extends Equatable {
  const InformationState();

  @override
  List<Object> get props => [];
}

final class InformationInitial extends InformationState {}

final class AuthUiChanging extends InformationState {}

final class AuthUiChanged extends InformationState {}
