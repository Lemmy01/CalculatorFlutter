import 'package:dartz/dartz.dart';
import 'package:usv_hub_management/core/errors/exceptions.dart';
import 'package:usv_hub_management/core/errors/failures.dart';
import 'package:usv_hub_management/features/add_students/data/datasources/student_api_service.dart';
import 'package:usv_hub_management/features/add_students/domain/repositories/add_students_repository.dart';
import 'package:usv_hub_management/features/add_teacher/data/models/user_model.dart';
import 'package:usv_hub_management/features/add_teacher/domain/entities/user_entity.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AddStudentsRepository)
class AddStudentsRepoImpl extends AddStudentsRepository {
  StudentApiService studentApiService;

  AddStudentsRepoImpl(this.studentApiService);

  @override
  Future<Either<Failure, void>> addStudent(
      {required UserEntity user,
      required String semesterId,
      required String password}) async {
    try {
      UserModel userModel = UserModel(
        id: user.id,
        name: user.name,
        email: user.email,
        phoneNumber: user.phoneNumber,
        fatherName: user.fatherName,
        motherName: user.motherName,
      );
      studentApiService.addStudent(userModel, password, semesterId);
      return const Right(null);
    } on MediumException catch (e) {
      return Left(MediumFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, List<UserEntity>>> getStudents(
      {required String semesterId}) async {
    try {
      final List<UserModel> students =
          await studentApiService.getStudents(semesterId);
      return Right(students);
    } on MediumException catch (e) {
      return Left(MediumFailure(message: e.message));
    }
  }
}
