import 'package:dartz/dartz.dart';
import 'package:usv_hub_management/core/errors/failures.dart';
import 'package:usv_hub_management/core/usecase/usecase.dart';
import 'package:usv_hub_management/features/add_students/domain/repositories/add_students_repository.dart';
import 'package:usv_hub_management/features/add_teacher/domain/entities/user_entity.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GetStudentsUsecase
    extends Usecase<Either<Failure, List<UserEntity>>, String> {
  final AddStudentsRepository _addStudentsRepository;

  GetStudentsUsecase(this._addStudentsRepository);
  @override
  Future<Either<Failure, List<UserEntity>>> call({required String params}) {
    return _addStudentsRepository.getStudents(semesterId: params);
  }
}
