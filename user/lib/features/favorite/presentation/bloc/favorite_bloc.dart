import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/bloc/usecases/usecase.dart';
import '../../../../core/entities/property.dart';
import '../../domain/usecases/edit_wish_list_usecase.dart';
import '../../domain/usecases/get_wish_list_usecase.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final GetWishListUseCase _getWishListUseCase;
  final EditWishListUseCase _editWishListUseCase;
  FavoriteBloc(this._getWishListUseCase, this._editWishListUseCase)
      : super(FavoriteInitial()) {
    on<GetFavoriteEvent>(onGetFavoriteEvent);
    on<EditFavoriteEvent>(onEditFavoriteEvent);
  }
  List<String> favoriteItems = [];
  void onGetFavoriteEvent(GetFavoriteEvent event, emit) async {
    emit(FavoriteDataLoadingState());
    final result = await _getWishListUseCase(NoParams());
    result.fold((l) => emit(FavoriteDataErrorState(message: l.errorMessage)),
        (r) {
      getFavoriteIds(r);
      emit(FavoriteDataLoadedState(properties: r));
    });
  }

  void onEditFavoriteEvent(
      EditFavoriteEvent event, Emitter<FavoriteState> emit) async {
    if (favoriteItems.contains(event.id)) {
      favoriteItems.remove(event.id);
      await editFavorite(event.id, false, emit);
    } else {
      favoriteItems.add(event.id);
      await editFavorite(event.id, true, emit);
    }
  }

  void getFavoriteIds(List<Property> properties) {
    List<String> items = [];
    for (var element in properties) {
      if (!items.contains(element.id)) {
        items.add(element.id);
      }
    }
    favoriteItems = items;
  }

  Future<void> editFavorite(
      String id, bool delete, Emitter<FavoriteState> emit) async {
    emit(FavoriteDataLoadingState());
    final result =
        await _editWishListUseCase(EditParams(delete: delete, id: id));
    result.fold((l) => emit(FavoriteDataErrorState(message: l.errorMessage)),
        (r) {
      getFavoriteIds(r);
      emit(FavoriteDataLoadedState(properties: r));
    });
  }
}
