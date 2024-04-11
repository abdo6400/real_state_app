import 'package:dartz/dartz.dart';
import '../../../../../config/database/error/failures.dart';
import '../../../../../core/bloc/usecases/usecase.dart';
import '../../../../core/entities/property.dart';
import '../repositories/favorite_repository.dart';



class GetWishListUseCase extends UseCase<List<Property>, NoParams> {
  final FavoriteRepository _favoriteRepository;

  GetWishListUseCase({required FavoriteRepository favoriteRepository})
      : _favoriteRepository = favoriteRepository;

  @override
  Future<Either<Failure, List<Property>>> call(params) =>
      _favoriteRepository.getWishList();
}
