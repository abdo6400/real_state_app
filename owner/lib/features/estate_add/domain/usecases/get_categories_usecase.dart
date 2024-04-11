import 'package:dartz/dartz.dart';

import '../../../../../config/database/error/failures.dart';
import '../../../../../core/bloc/usecases/usecase.dart';
import '../entities/category.dart';
import '../repositories/estate_repository.dart';

class GetCategoriesUseCase extends UseCase<List<Category>,NoParams> {
  final EstateRepository _estateRepository;

  GetCategoriesUseCase({required EstateRepository estateRepository})
      : _estateRepository = estateRepository;

  @override
  Future<Either<Failure, List<Category>>> call(params) =>
      _estateRepository.getCategories();
}
