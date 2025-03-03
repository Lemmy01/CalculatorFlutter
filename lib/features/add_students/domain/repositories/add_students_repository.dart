import 'package:dartz/dartz.dart';
import 'package:desktop_math/core/errors/failures.dart';
import 'package:desktop_math/features/add_teacher/domain/entities/user_entity.dart';

abstract class AddStudentsRepository {
  Future<Either<Failure, void>> addStudent({
    required UserEntity user,
    required String semesterId,
    required String password,
  });

  Future<Either<Failure, List<UserEntity>>> getStudents({
    required String semesterId,
  });
}
