import 'package:dartz/dartz.dart';
import 'package:desktop_math/core/errors/failures.dart';
import 'package:desktop_math/features/view_departaments/domain/entities/departament_entity.dart';

abstract class DepartamentRepository {
  Future<Either<List<DepartamentEntity>, Failure>> getDepartaments();
}
