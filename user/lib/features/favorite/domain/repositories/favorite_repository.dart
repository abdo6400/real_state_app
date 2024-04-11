import 'package:dartz/dartz.dart';
import '../../../../config/database/error/failures.dart';
import '../../../../core/entities/property.dart';

abstract class FavoriteRepository {
  Future<Either<Failure, List<Property>>> getWishList();
  Future<Either<Failure, List<Property>>> editWishList(String id, bool delete);
}
