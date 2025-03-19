import 'package:dartz/dartz.dart';
import 'package:usv_hub_management/core/errors/exceptions.dart';
import 'package:usv_hub_management/core/errors/failures.dart';
import 'package:usv_hub_management/features/add_teacher/data/models/user_model.dart';
import 'package:usv_hub_management/features/view_departaments/data/datasources/departament_api_service.dart';
import 'package:usv_hub_management/features/view_departaments/data/models/course_model.dart';
import 'package:usv_hub_management/features/view_departaments/data/models/semester_model.dart';
import 'package:usv_hub_management/features/view_departaments/domain/entities/course_entity.dart';
import 'package:usv_hub_management/features/view_departaments/domain/entities/departament_entity.dart';
import 'package:usv_hub_management/features/view_departaments/domain/entities/semester_entity.dart';
import 'package:usv_hub_management/features/view_departaments/domain/repositories/departament_repo.dart';
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

  @override
  Future<Either<Failure, void>> addSemester(SemesterEntity semester) async {
    try {
      final SemesterModel model = SemesterModel.fromEntity(semester);
      await departamentApiService.addSemester(model);
      return const Right(null);
    } on MediumException catch (e) {
      return Left(MediumFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, void>> addCourse(CourseEntity course) async {
    try {
      final CourseModel model = CourseModel.fromEntity(course);
      departamentApiService.addCourse(model);
      return const Right(null);
    } on MediumException catch (e) {
      return Left(MediumFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, UserModel>> getTeacherInfo(String teacherId) async {
    try {
      final teacher = await departamentApiService.getTeacherInfo(teacherId);
      return Right(teacher);
    } on MediumException catch (e) {
      return Left(MediumFailure(message: e.message));
    }
  }
}
