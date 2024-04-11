import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user/features/home/domain/usecases/get_top_owners_usecase.dart';

import '../../../../../core/bloc/usecases/usecase.dart';
import '../../../../../core/entities/property.dart';

part 'top_owners_event.dart';
part 'top_owners_state.dart';

class TopOwnersBloc extends Bloc<TopOwnersEvent, TopOwnersState> {
  final GetTopOwnersUseCase _getTopOwnersUseCase;
  TopOwnersBloc(this._getTopOwnersUseCase) : super(TopOwnersInitial()) {
    on<GetTopOwnersEvent>(onGetTopOwnersEvent);
  }

  void onGetTopOwnersEvent(GetTopOwnersEvent event, emit) async {
    emit(GetTopOwnersLoadingState());
    final result = await _getTopOwnersUseCase(NoParams());
    result.fold((l) => emit(GetTopOwnersErrorState(message: l.errorMessage)),
        (r) {
      emit(GetTopOwnersLoadedState(owners: r));
    });
  }
}
