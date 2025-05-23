import 'package:dartz/dartz.dart';
import 'package:usv_hub_management/core/errors/failures.dart';
import 'package:usv_hub_management/core/usecase/usecase.dart';
import 'package:usv_hub_management/features/login/domain/repositories/auth_repo.dart';

import 'package:injectable/injectable.dart';

@LazySingleton()
class IsLogedInUsecase extends Usecase<Either<Failure, bool>, void> {
  final AuthRepo _authRepo;

  IsLogedInUsecase(this._authRepo);
  @override
  Future<Either<Failure, bool>> call({required void params}) {
    return _authRepo.isLogedIn();
  }
}
