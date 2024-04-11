import 'package:dartz/dartz.dart';
import 'package:user/core/entities/property.dart';
import 'package:user/features/home/domain/repositories/home_repository.dart';
import '../../../../../config/database/error/failures.dart';
import '../../../../../core/bloc/usecases/usecase.dart';

class GetTopOwnersUseCase extends UseCase<List<Owner>, NoParams> {
  final HomeRepository _homeRepository;

  GetTopOwnersUseCase({required HomeRepository homeRepository})
      : _homeRepository = homeRepository;

  @override
  Future<Either<Failure, List<Owner>>> call(params) =>
      _homeRepository.getTopOwners();
}
