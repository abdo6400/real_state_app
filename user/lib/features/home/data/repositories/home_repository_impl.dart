import 'package:dartz/dartz.dart';

import 'package:user/config/database/error/failures.dart';

import 'package:user/core/entities/property.dart';
import 'package:user/features/home/data/datasources/home_remote_data_source.dart';

import 'package:user/features/home/domain/entities/category.dart';

import '../../../../config/database/error/exceptions.dart';
import '../../domain/repositories/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteDataSource _homeRemoteDataSource;

  HomeRepositoryImpl({required HomeRemoteDataSource homeRemoteDataSource})
      : _homeRemoteDataSource = homeRemoteDataSource;
  @override
  Future<Either<Failure, List<Category>>> getCategories() async {
    try {
      final response = await _homeRemoteDataSource.getCategories();
      return Right(response);
    } on ServerException catch (failure) {
      return Left(ServerFailure(errorMessage: failure.errorMessage));
    }
  }

  @override
  Future<Either<Failure, List<Property>>> getNearbyLocations(
      {List<double>? location}) async {
    try {
      final response =
          await _homeRemoteDataSource.getNearbyLocations(location: location);
      return Right(response);
    } on ServerException catch (failure) {
      return Left(ServerFailure(errorMessage: failure.errorMessage));
    }
  }

  @override
  Future<Either<Failure, List<Property>>> getTopLocations() async {
    try {
      final response = await _homeRemoteDataSource.getTopLocations();
      return Right(response);
    } on ServerException catch (failure) {
      return Left(ServerFailure(errorMessage: failure.errorMessage));
    }
  }

  @override
  Future<Either<Failure, List<Owner>>> getTopOwners() async {
    try {
      final response = await _homeRemoteDataSource.getTopOwners();
      return Right(response);
    } on ServerException catch (failure) {
      return Left(ServerFailure(errorMessage: failure.errorMessage));
    }
  }
}
