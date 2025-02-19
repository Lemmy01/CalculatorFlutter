import 'package:dartz/dartz.dart';
import 'package:desktop_math/core/errors/failures.dart';
import 'package:desktop_math/core/usecase/usecase.dart';
import 'package:desktop_math/features/view_departaments/domain/entities/semester_entity.dart';
import 'package:desktop_math/features/view_departaments/domain/repositories/departament_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class AddSemesterUsecase
    extends Usecase<Either<Failure, void>, SemesterEntity> {
  final DepartamentRepository _departamentRepo;

  AddSemesterUsecase(this._departamentRepo);
  @override
  Future<Either<Failure, void>> call({required SemesterEntity params}) {
    return _departamentRepo.addSemester(params);
  }
}
