import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:owner/core/bloc/usecases/usecase.dart';
import 'package:owner/features/estate_add/domain/usecases/add_estate_usecase.dart';
import '../../data/models/property_model_params.dart';
import '../../domain/entities/category.dart';
import '../../domain/usecases/get_categories_usecase.dart';

part 'estate_add_event.dart';
part 'estate_add_state.dart';

class EstateAddBloc extends Bloc<EstateAddEvent, EstateAddState> {
  final AddEstateUseCase _addEstateUseCase;
  final GetCategoriesUseCase _categoriesUseCase;
  EstateAddBloc(this._addEstateUseCase, this._categoriesUseCase)
      : super(EstateAddInitial()) {
    on<AddPropertyEvent>(onAddPropertyEvent);
    on<GetCategoriesEvent>(onGetCategoriesEvent);
  }
  void onAddPropertyEvent(AddPropertyEvent event, emit) async {
    emit(AddEstateLoadingState());
    emit(await _addEstateUseCase(event.propertyModel).then((value) =>
        value.fold((l) => AddEstateErrorState(message: l.errorMessage),
            (r) => AddEstateSucessState(message: r))));
  }

  List<Category> categories = [];
  void onGetCategoriesEvent(GetCategoriesEvent event, emit) async {
    emit(GetAllCategoriesLoadingState());
    final result = await _categoriesUseCase(NoParams());
    result.fold(
        (l) => emit(GetAllCategoriesErrorState(message: l.errorMessage)), (r) {
      categories = r;
      emit(GetAllCategoriesLoadedState());
    });
  }
}
