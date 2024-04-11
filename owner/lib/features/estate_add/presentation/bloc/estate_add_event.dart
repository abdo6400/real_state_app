part of 'estate_add_bloc.dart';

abstract class EstateAddEvent extends Equatable {
  const EstateAddEvent();

  @override
  List<Object> get props => [];
}

class AddPropertyEvent extends EstateAddEvent {
  final PropertyModelParams propertyModel;

  const AddPropertyEvent({required this.propertyModel});
}

class GetCategoriesEvent extends EstateAddEvent {}
