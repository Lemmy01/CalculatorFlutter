import 'package:dartz/dartz.dart';
import 'package:usv_hub_management/core/consts.dart';
import 'package:usv_hub_management/core/errors/failures.dart';
import 'package:usv_hub_management/core/usecase/usecase.dart';
import 'package:usv_hub_management/features/add_students/domain/repositories/add_students_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class AddStudentUsecase
    extends Usecase<Either<Failure, void>, Map<String, dynamic>> {
  final AddStudentsRepository _studentRepository;

  AddStudentUsecase(this._studentRepository);
  @override
  Future<Either<Failure, void>> call({required Map<String, dynamic> params}) {
    return _studentRepository.addStudent(
        user: params[AppArguments.userEntity],
        semesterId: params[AppArguments.semesterId],
        password: params[AppArguments.password]);
  }
}
