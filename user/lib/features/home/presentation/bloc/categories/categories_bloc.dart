import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/bloc/usecases/usecase.dart';
import '../../../domain/entities/category.dart';
import '../../../domain/usecases/get_categories_usecase.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final GetCategoriesUseCase _categoriesUseCase;
  CategoriesBloc(this._categoriesUseCase) : super(CategoriesInitial()) {
    on<GetCategoriesEvent>(onGetCategoriesEvent);
  }

  void onGetCategoriesEvent(GetCategoriesEvent event, emit) async {
    emit(GetAllCategoriesLoadingState());
    final result = await _categoriesUseCase(NoParams());
    result.fold(
        (l) => emit(GetAllCategoriesErrorState(message: l.errorMessage)), (r) {
      emit(GetAllCategoriesLoadedState(categories: r));
    });
  }
}
