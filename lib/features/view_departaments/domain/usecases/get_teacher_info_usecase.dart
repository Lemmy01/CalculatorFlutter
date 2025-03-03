import 'package:dartz/dartz.dart';
import 'package:desktop_math/core/errors/failures.dart';
import 'package:desktop_math/core/usecase/usecase.dart';
import 'package:desktop_math/features/add_teacher/domain/entities/user_entity.dart';
import 'package:desktop_math/features/view_departaments/domain/repositories/departament_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GetTeacherInfoUsecase
    extends Usecase<Either<Failure, UserEntity>, String> {
  final DepartamentRepository _departamentRepo;

  GetTeacherInfoUsecase(this._departamentRepo);
  @override
  Future<Either<Failure, UserEntity>> call({required String params}) {
    return _departamentRepo.getTeacherInfo(params);
  }
}
