import 'package:dartz/dartz.dart';
import 'package:desktop_math/core/consts.dart';
import 'package:desktop_math/core/errors/failures.dart';
import 'package:desktop_math/core/usecase/usecase.dart';
import 'package:desktop_math/features/login/domain/repositories/auth_repo.dart';

import 'package:injectable/injectable.dart';

@LazySingleton()
class LoginUsecase extends Usecase<Either<Failure, void>, Map<String, String>> {
  final AuthRepo _authRepo;

  LoginUsecase(this._authRepo);
  @override
  Future<Either<Failure, void>> call({required Map<String, String> params}) {
    return _authRepo.login(
        params[AppTextConst.email]!, params[AppTextConst.password]!);
  }
}
