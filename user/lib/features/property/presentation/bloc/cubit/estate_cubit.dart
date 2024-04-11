import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'estate_state.dart';

class EstateCubit extends Cubit<EstateState> {
  EstateCubit() : super(EstateInitial());
  bool isMoreDeails = false;
  void changeDetailsView() {
    emit(EstateChangeDetailsView());
    isMoreDeails = !isMoreDeails;
    emit(EstateChangedDetailsView());
  }
}
