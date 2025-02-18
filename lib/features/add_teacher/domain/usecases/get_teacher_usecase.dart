import 'package:dartz/dartz.dart';
import 'package:desktop_math/core/errors/failures.dart';
import 'package:desktop_math/core/usecase/usecase.dart';
import 'package:desktop_math/features/add_teacher/domain/entities/user_entity.dart';
import 'package:desktop_math/features/add_teacher/domain/repositories/add_teacher_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GetTeacherUsecase
    extends Usecase<Either<Failure, List<UserEntity>>, String> {
  final AddTeacherRepository _departamentRepo;

  GetTeacherUsecase(this._departamentRepo);
  @override
  Future<Either<Failure, List<UserEntity>>> call({required String params}) {
    return _departamentRepo.getTeachers(departamentId: params);
  }
}
