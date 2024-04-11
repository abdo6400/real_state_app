import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'top_location_event.dart';
part 'top_location_state.dart';

class TopLocationBloc extends Bloc<TopLocationEvent, TopLocationState> {
  TopLocationBloc() : super(TopLocationInitial()) {
    on<TopLocationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
