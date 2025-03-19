import 'package:dartz/dartz.dart';
import 'package:usv_hub_management/core/errors/failures.dart';
import 'package:usv_hub_management/features/add_teacher/domain/entities/user_entity.dart';

abstract class AddTeacherRepository {
  Future<Either<Failure, void>> addTeacher({
    required UserEntity user,
    required String departamentId,
    required String password,
  });

  Future<Either<Failure, List<UserEntity>>> getTeachers({
    required String departamentId,
  });
}
