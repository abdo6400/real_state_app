import 'package:dartz/dartz.dart';
import '../../../../../config/database/error/failures.dart';
import '../../../../../core/bloc/usecases/usecase.dart';
import '../repositories/profile_repository.dart';

class DeleteUserUseCase extends UseCase<String, NoParams> {
  final ProfileRepository _profileRepository;

  DeleteUserUseCase({required ProfileRepository profileRepository})
      : _profileRepository = profileRepository;
  @override
  Future<Either<Failure, String>> call(params) =>
      _profileRepository.deleteUser();
}
