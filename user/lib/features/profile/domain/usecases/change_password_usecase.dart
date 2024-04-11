import 'package:dartz/dartz.dart';
import '../../../../../config/database/error/failures.dart';
import '../../../../../core/bloc/usecases/usecase.dart';
import '../repositories/profile_repository.dart';

class ChangePasswordUseCase extends UseCase<String, ChangePasswordParams> {
  final ProfileRepository _profileRepository;

  ChangePasswordUseCase({required ProfileRepository profileRepository})
      : _profileRepository = profileRepository;
  @override
  Future<Either<Failure, String>> call(params) =>
      _profileRepository.changePassword(
          params.oldPassword, params.newPassword, params.confirmPassword);
}

class ChangePasswordParams {
  final String oldPassword;
  final String newPassword;
  final String confirmPassword;

  ChangePasswordParams(
      {required this.oldPassword,
      required this.newPassword,
      required this.confirmPassword});
}
