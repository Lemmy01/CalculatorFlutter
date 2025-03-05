import 'package:dartz/dartz.dart';
import 'package:desktop_math/core/errors/failures.dart';

abstract class AuthRepo {
  Future<Either<Failure, void>> login(String email, String password);
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, bool>> isLogedIn();
}
