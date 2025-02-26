import 'package:dartz/dartz.dart';
import 'package:desktop_math/core/errors/failures.dart';
import 'package:desktop_math/core/usecase/usecase.dart';
import 'package:desktop_math/features/view_departaments/domain/entities/course_entity.dart';
import 'package:desktop_math/features/view_departaments/domain/repositories/departament_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class AddCourseUsecase extends Usecase<Either<Failure, void>, CourseEntity> {
  final DepartamentRepository _departamentRepo;

  AddCourseUsecase(this._departamentRepo);
  @override
  Future<Either<Failure, void>> call({required CourseEntity params}) {
    return _departamentRepo.addCourse(params);
  }
}
