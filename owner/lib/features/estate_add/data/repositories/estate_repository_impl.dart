import 'package:dartz/dartz.dart';

import 'package:owner/config/database/error/failures.dart';

import 'package:owner/features/estate_add/data/models/property_model_params.dart';
import 'package:owner/features/estate_add/domain/entities/category.dart';

import '../../domain/repositories/estate_repository.dart';
import '../datasources/estate_remote_data_source.dart';

class EstateRepositoryImpl extends EstateRepository {
  final EstateRemoteDataSource _estateRemoteDataSource;

  EstateRepositoryImpl({required EstateRemoteDataSource estateRemoteDataSource})
      : _estateRemoteDataSource = estateRemoteDataSource;
  @override
  Future<Either<Failure, String>> addEstate(
      {required PropertyModelParams estateModel}) async {
    try {
      final response =
          await _estateRemoteDataSource.addEstate(property: estateModel);

      return Right(response);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, List<Category>>> getCategories() async{
   try {
      final response =
          await _estateRemoteDataSource.getCategories();

      return Right(response);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }
}
