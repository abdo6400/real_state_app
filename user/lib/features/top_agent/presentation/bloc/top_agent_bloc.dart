import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'top_agent_event.dart';
part 'top_agent_state.dart';

class TopAgentBloc extends Bloc<TopAgentEvent, TopAgentState> {
  TopAgentBloc() : super(TopAgentInitial()) {
    on<TopAgentEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
