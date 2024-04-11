
import 'package:equatable/equatable.dart';

abstract class EstateState extends Equatable {
  const EstateState();

  @override
  List<Object> get props => [];
}

class EstateInitial extends EstateState {}
class EstateChanged extends EstateState {}

class EstateChangeDetailsView extends EstateState {}

class EstateChangedDetailsView extends EstateState {}

class ImagesListState extends EstateState {}

class ImagesListChangedState extends EstateState {}

class VisibilityInital extends EstateState {}
class VisibilityChanged extends EstateState {}
class ChangeNumberOfFeature extends EstateState {}
class ChangeNumberOfFeatureDone extends EstateState {}
class AddEstateLoadingState extends EstateState {}
class AddEstateSucessState extends EstateState {
  final String message;

 const AddEstateSucessState({required this.message});
}
class AddEstateErrorState extends EstateState {
  final String message;

 const AddEstateErrorState({required this.message});
}