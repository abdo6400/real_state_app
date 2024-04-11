import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user/core/bloc/usecases/usecase.dart';
import 'package:user/features/home/domain/usecases/get_top_locations_usecase.dart';

import '../../../../../core/entities/property.dart';

part 'top_locations_event.dart';
part 'top_locations_state.dart';

class TopLocationsBloc extends Bloc<TopLocationsEvent, TopLocationsState> {
  final GetTopLocationsUseCase _getTopLocationsUseCase;
  TopLocationsBloc(this._getTopLocationsUseCase)
      : super(TopLocationsInitial()) {
    on<GetTopLocationsEvent>(onGetTopLocationsEvent);
  }

  void onGetTopLocationsEvent(GetTopLocationsEvent event, emit) async {
    emit(GetTopLocationsLoadingState());
    final result = await _getTopLocationsUseCase(NoParams());
    result.fold((l) => emit(GetTopLocationsErrorState(message: l.errorMessage)),
        (r) {
      emit(GetTopLocationsLoadedState(properties: r));
    });
  }
}
