import 'package:dartz/dartz.dart';
import 'package:user/features/home/domain/repositories/home_repository.dart';

import '../../../../../config/database/error/failures.dart';
import '../../../../../core/bloc/usecases/usecase.dart';
import '../entities/category.dart';

class GetCategoriesUseCase extends UseCase<List<Category>, NoParams> {
  final HomeRepository _homeRepository;

  GetCategoriesUseCase({required HomeRepository homeRepository})
      : _homeRepository = homeRepository;

  @override
  Future<Either<Failure, List<Category>>> call(params) =>
      _homeRepository.getCategories();
}
