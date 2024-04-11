import 'package:dartz/dartz.dart';
import 'package:user/config/database/error/failures.dart';

import '../entities/user.dart';

abstract class ProfileRepository {
  Future<Either<Failure, User>> getUser();
  Future<Either<Failure, String>> deleteUser();
  Future<Either<Failure, User>> editUser(String phone, String name);
  Future<Either<Failure, String>> changePassword(
      String oldPassword, String newPassword, String confirmPassword);
}
