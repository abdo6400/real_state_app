import 'package:dartz/dartz.dart';
import 'package:user/config/database/error/failures.dart';

import '../../../../core/entities/property.dart';
import '../entities/category.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<Category>>> getCategories();
  Future<Either<Failure, List<Property>>> getTopLocations();
  Future<Either<Failure, List<Owner>>> getTopOwners();
  Future<Either<Failure, List<Property>>> getNearbyLocations(
      {List<double>? location});
}
