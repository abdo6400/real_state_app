part of 'estate_add_bloc.dart';

abstract class EstateAddState extends Equatable {
  const EstateAddState();

  @override
  List<Object> get props => [];
}

class EstateAddInitial extends EstateAddState {}

class AddEstateLoadingState extends EstateAddState {}

class AddEstateSucessState extends EstateAddState {
  final String message;

  const AddEstateSucessState({required this.message});
}

class AddEstateErrorState extends EstateAddState {
  final String message;

  const AddEstateErrorState({required this.message});
}

class GetAllCategoriesLoadingState extends EstateAddState {}

class GetAllCategoriesLoadedState extends EstateAddState {}

class GetAllCategoriesErrorState extends EstateAddState {
  final String message;

  const GetAllCategoriesErrorState({required this.message});
}
