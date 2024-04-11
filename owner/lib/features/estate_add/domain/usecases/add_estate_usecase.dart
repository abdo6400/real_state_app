import 'package:dartz/dartz.dart';

import '../../../../../config/database/error/failures.dart';
import '../../../../../core/bloc/usecases/usecase.dart';
import '../../data/models/property_model_params.dart';
import '../repositories/estate_repository.dart';

class AddEstateUseCase extends UseCase<String, PropertyModelParams> {
  final EstateRepository _estateRepository;

  AddEstateUseCase({required EstateRepository estateRepository})
      : _estateRepository = estateRepository;

  @override
  Future<Either<Failure, String>> call(params) =>
      _estateRepository.addEstate(estateModel: params);
}
