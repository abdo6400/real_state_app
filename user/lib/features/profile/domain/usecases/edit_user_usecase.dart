import 'package:dartz/dartz.dart';
import '../../../../../config/database/error/failures.dart';
import '../../../../../core/bloc/usecases/usecase.dart';
import '../entities/user.dart';
import '../repositories/profile_repository.dart';

class EditUserUseCase extends UseCase<User, EditUserParams> {
  final ProfileRepository _profileRepository;

  EditUserUseCase({required ProfileRepository profileRepository})
      : _profileRepository = profileRepository;
  @override
  Future<Either<Failure, User>> call(params) =>
      _profileRepository.editUser(params.phone, params.name);
}

class EditUserParams {
  final String phone;
  final String name;

  EditUserParams({required this.phone, required this.name});
}
