import 'package:dartz/dartz.dart';
import 'package:desktop_math/core/errors/failures.dart';
import 'package:desktop_math/features/view_departaments/domain/entities/departament_entity.dart';
import 'package:desktop_math/features/view_departaments/domain/repositories/departament_repo.dart';

class DepartamentRepoImpl extends DepartamentRepository {
  @override
  Future<Either<List<DepartamentEntity>, Failure>> getDepartaments() {}
}
