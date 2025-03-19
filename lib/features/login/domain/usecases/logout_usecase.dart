import 'package:dartz/dartz.dart';
import 'package:usv_hub_management/core/errors/failures.dart';
import 'package:usv_hub_management/core/usecase/usecase.dart';
import 'package:usv_hub_management/features/login/domain/repositories/auth_repo.dart';

import 'package:injectable/injectable.dart';

@LazySingleton()
class LogoutUsecase extends Usecase<Either<Failure, void>, void> {
  final AuthRepo _authRepo;

  LogoutUsecase(this._authRepo);
  @override
  Future<Either<Failure, void>> call({required void params}) {
    return _authRepo.logout();
  }
}
