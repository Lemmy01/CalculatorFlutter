import 'package:dartz/dartz.dart';
import 'package:desktop_math/core/errors/exceptions.dart';
import 'package:desktop_math/core/errors/failures.dart';
import 'package:desktop_math/features/add_teacher/data/datasources/teacher_api_service.dart';
import 'package:desktop_math/features/add_teacher/data/models/user_model.dart';
import 'package:desktop_math/features/add_teacher/domain/entities/user_entity.dart';
import 'package:desktop_math/features/add_teacher/domain/repositories/add_teacher_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AddTeacherRepository)
class AddTeacherRepoImpl extends AddTeacherRepository {
  TeacherApiService teacherApiService;

  AddTeacherRepoImpl(this.teacherApiService);

  @override
  Future<Either<Failure, void>> addTeacher({
    required UserEntity user,
    required String departamentId,
    required String password,
  }) async {
    try {
      UserModel userModel = UserModel(
        id: user.id,
        name: user.name,
        email: user.email,
        phoneNumber: user.phoneNumber,
        fatherName: user.fatherName,
        motherName: user.motherName,
      );
      await teacherApiService.addTeacher(userModel, password, departamentId);
      return const Right(null);
    } on MediumException catch (e) {
      return Left(MediumFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, List<UserEntity>>> getTeachers(
      {required String departamentId}) async {
    try {
      final List<UserModel> teachers =
          await teacherApiService.getTeachers(departamentId);
      return Right(teachers);
    } on MediumException catch (e) {
      return Left(MediumFailure(message: e.message));
    }
  }
}
