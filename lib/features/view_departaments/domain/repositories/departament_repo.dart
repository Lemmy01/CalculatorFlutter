import 'package:dartz/dartz.dart';
import 'package:usv_hub_management/core/errors/failures.dart';
import 'package:usv_hub_management/features/add_teacher/data/models/user_model.dart';
import 'package:usv_hub_management/features/view_departaments/domain/entities/course_entity.dart';
import 'package:usv_hub_management/features/view_departaments/domain/entities/departament_entity.dart';
import 'package:usv_hub_management/features/view_departaments/domain/entities/semester_entity.dart';

abstract class DepartamentRepository {
  Future<Either<Failure, List<DepartamentEntity>>> getDepartaments();
  Future<Either<Failure, List<SemesterEntity>>> getSemesters(
      String departamentId);
  Future<Either<Failure, List<CourseEntity>>> getCourses(String semesterId);
  Future<Either<Failure, void>> addSemester(SemesterEntity semester);
  Future<Either<Failure, void>> addCourse(CourseEntity course);
  Future<Either<Failure, UserModel>> getTeacherInfo(String teacherId);
}
