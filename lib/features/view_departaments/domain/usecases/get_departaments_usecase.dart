import 'package:dartz/dartz.dart';
import 'package:usv_hub_management/core/errors/failures.dart';
import 'package:usv_hub_management/core/usecase/usecase.dart';
import 'package:usv_hub_management/features/view_departaments/domain/entities/departament_entity.dart';
import 'package:usv_hub_management/features/view_departaments/domain/repositories/departament_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GetDepartamentsUsecase
    extends Usecase<Either<Failure, List<DepartamentEntity>>, String> {
  final DepartamentRepository _departamentRepo;

  GetDepartamentsUsecase(this._departamentRepo);
  @override
  Future<Either<Failure, List<DepartamentEntity>>> call({void params}) {
    return _departamentRepo.getDepartaments();
  }
}
