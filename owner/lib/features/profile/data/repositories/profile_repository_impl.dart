import 'package:dartz/dartz.dart';
import '../../../../config/database/error/exceptions.dart';
import '../../../../config/database/error/failures.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/profile_remote_data_source.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileDataSource _profileDataSource;

  ProfileRepositoryImpl({required ProfileDataSource profileDataSource})
      : _profileDataSource = profileDataSource;

  @override
  Future<Either<Failure, User>> getUser() async {
    try {
      final response = await _profileDataSource.getUser();
      return Right(response);
    } on ServerException catch (failure) {
      return Left(ServerFailure(errorMessage: failure.errorMessage));
    }
  }

  @override
  Future<Either<Failure, String>> changePassword(
      String oldPassword, String newPassword, String confirmPassword) async {
    try {
      final response = await _profileDataSource.changePassword(
          oldPassword, newPassword, confirmPassword);
      return Right(response);
    } on ServerException catch (failure) {
      return Left(ServerFailure(errorMessage: failure.errorMessage));
    }
  }

  @override
  Future<Either<Failure, String>> deleteUser() async {
    try {
      final response = await _profileDataSource.deleteUser();
      return Right(response);
    } on ServerException catch (failure) {
      return Left(ServerFailure(errorMessage: failure.errorMessage));
    }
  }

  @override
  Future<Either<Failure, User>> editUser(String phone, String name) async {
    try {
      final response = await _profileDataSource.editUser(phone, name);
      return Right(response);
    } on ServerException catch (failure) {
      return Left(ServerFailure(errorMessage: failure.errorMessage));
    }
  }
}
