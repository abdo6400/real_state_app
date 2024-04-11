import 'package:dartz/dartz.dart';
import 'package:owner/config/database/error/failures.dart';

import '../../data/models/property_model_params.dart';
import '../entities/category.dart';

abstract class EstateRepository {
  Future<Either<Failure, String>> addEstate(
      {required PropertyModelParams estateModel});
  Future<Either<Failure, List<Category>>> getCategories();
}
