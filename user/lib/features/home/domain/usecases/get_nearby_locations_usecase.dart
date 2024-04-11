import 'package:dartz/dartz.dart';
import 'package:user/features/home/domain/repositories/home_repository.dart';

import '../../../../../config/database/error/failures.dart';
import '../../../../../core/bloc/usecases/usecase.dart';
import '../../../../core/entities/property.dart';

class GetNearbyLocationsUseCase extends UseCase<List<Property>, List<double>> {
  final HomeRepository _homeRepository;

  GetNearbyLocationsUseCase({required HomeRepository homeRepository})
      : _homeRepository = homeRepository;

  @override
  Future<Either<Failure, List<Property>>> call(params) =>
      _homeRepository.getNearbyLocations(location: params);
}
