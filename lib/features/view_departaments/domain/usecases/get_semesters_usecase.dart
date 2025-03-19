import 'package:dartz/dartz.dart';
import 'package:usv_hub_management/core/errors/failures.dart';
import 'package:usv_hub_management/core/usecase/usecase.dart';
import 'package:usv_hub_management/features/view_departaments/domain/entities/semester_entity.dart';
import 'package:usv_hub_management/features/view_departaments/domain/repositories/departament_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GetSemestersUsecase
    extends Usecase<Either<Failure, List<SemesterEntity>>, String> {
  final DepartamentRepository _departamentRepo;

  GetSemestersUsecase(this._departamentRepo);
  @override
  Future<Either<Failure, List<SemesterEntity>>> call({required String params}) {
    return _departamentRepo.getSemesters(params);
  }
}
