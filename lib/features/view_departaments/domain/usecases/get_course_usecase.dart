import 'package:dartz/dartz.dart';
import 'package:desktop_math/core/errors/failures.dart';
import 'package:desktop_math/core/usecase/usecase.dart';
import 'package:desktop_math/features/view_departaments/domain/entities/course_entity.dart';
import 'package:desktop_math/features/view_departaments/domain/repositories/departament_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GetCoursesUsecase
    extends Usecase<Either<Failure, List<CourseEntity>>, String> {
  final DepartamentRepository _departamentRepo;

  GetCoursesUsecase(this._departamentRepo);
  @override
  Future<Either<Failure, List<CourseEntity>>> call({required String params}) {
    return _departamentRepo.getCourses(params);
  }
}
