import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/entities/property.dart';
import '../../../domain/usecases/get_nearby_locations_usecase.dart';

part 'nearby_locations_event.dart';
part 'nearby_locations_state.dart';

class NearbyLocationsBloc
    extends Bloc<NearbyLocationsEvent, NearbyLocationsState> {
  final GetNearbyLocationsUseCase _getNearbyLocationsUseCase;
  NearbyLocationsBloc(this._getNearbyLocationsUseCase)
      : super(NearbyLocationsInitial()) {
    on<GetNearbyLocationsEvent>(onGetNearbyLocationsEvent);
  }

  void onGetNearbyLocationsEvent(GetNearbyLocationsEvent event, emit) async {
    emit(GetNearbyLocationsLoadingState());
    final result = await _getNearbyLocationsUseCase(event.location);
    result.fold(
        (l) => emit(GetNearbyLocationsErrorState(message: l.errorMessage)),
        (r) {
      emit(GetNearbyLocationsLoadedState(properties: r));
    });
  }
}
