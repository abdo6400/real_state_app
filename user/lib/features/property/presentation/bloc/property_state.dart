part of 'property_bloc.dart';

abstract class PropertyState extends Equatable {
  const PropertyState();  

  @override
  List<Object> get props => [];
}
class PropertyInitial extends PropertyState {}
