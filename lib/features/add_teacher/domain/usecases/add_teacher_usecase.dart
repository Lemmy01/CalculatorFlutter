import 'package:dartz/dartz.dart';
import 'package:usv_hub_management/core/consts.dart';
import 'package:usv_hub_management/core/errors/failures.dart';
import 'package:usv_hub_management/core/usecase/usecase.dart';
import 'package:usv_hub_management/features/add_teacher/domain/repositories/add_teacher_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class AddTeacherUsecase
    extends Usecase<Either<Failure, void>, Map<String, dynamic>> {
  final AddTeacherRepository _teacherRepo;

  AddTeacherUsecase(this._teacherRepo);
  @override
  Future<Either<Failure, void>> call({required Map<String, dynamic> params}) {
    return _teacherRepo.addTeacher(
        user: params[AppArguments.userEntity],
        departamentId: params[AppArguments.departament],
        password: params[AppArguments.password]);
  }
}
