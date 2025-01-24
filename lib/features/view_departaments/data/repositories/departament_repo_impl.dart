import 'package:dartz/dartz.dart';
import 'package:desktop_math/core/errors/exceptions.dart';
import 'package:desktop_math/core/errors/failures.dart';
import 'package:desktop_math/features/view_departaments/data/datasources/departament_api_service.dart';
import 'package:desktop_math/features/view_departaments/domain/entities/course_entity.dart';
import 'package:desktop_math/features/view_departaments/domain/entities/departament_entity.dart';
import 'package:desktop_math/features/view_departaments/domain/entities/semester_entity.dart';
import 'package:desktop_math/features/view_departaments/domain/repositories/departament_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: DepartamentRepository)
class DepartamentRepoImpl extends DepartamentRepository {
  final DepartamentApiService departamentApiService;

  DepartamentRepoImpl({required this.departamentApiService});
  @override
  Future<Either<Failure, List<DepartamentEntity>>> getDepartaments() async {
    try {
      final departaments = await departamentApiService.getDepartaments();
      return Right(departaments);
    } on MediumException catch (e) {
      return Left(MediumFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, List<CourseEntity>>> getCourses(
      String semesterId) async {
    try {
      final courses = await departamentApiService.getCourses(semesterId);
      return Right(courses);
    } on MediumException catch (e) {
      return Left(MediumFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, List<SemesterEntity>>> getSemesters(
      String departamentId) async {
    try {
      final semesterList =
          await departamentApiService.getSemesters(departamentId);
      return Right(semesterList);
    } on MediumException catch (e) {
      return Left(MediumFailure(message: e.message));
    }
  }
}
