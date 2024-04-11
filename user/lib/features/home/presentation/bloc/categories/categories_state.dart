part of 'categories_bloc.dart';

sealed class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object> get props => [];
}

final class CategoriesInitial extends CategoriesState {}

class GetAllCategoriesLoadingState extends CategoriesState {}

class GetAllCategoriesLoadedState extends CategoriesState {
  final List<Category> categories;

  const GetAllCategoriesLoadedState({required this.categories});
}

class GetAllCategoriesErrorState extends CategoriesState {
  final String message;

  const GetAllCategoriesErrorState({required this.message});
}
