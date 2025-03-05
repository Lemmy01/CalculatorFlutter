// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:desktop_math/core/errors/exceptions.dart';
import 'package:desktop_math/features/login/data/datasources/login_service.dart';
import 'package:injectable/injectable.dart';

import 'package:desktop_math/core/errors/failures.dart';
import 'package:desktop_math/features/login/domain/repositories/auth_repo.dart';

@LazySingleton(as: AuthRepo)
class AuthRepoImpl extends AuthRepo {
  final LoginService _loginService;

  AuthRepoImpl({required LoginService loginService})
      : _loginService = loginService;

  @override
  Future<Either<Failure, bool>> isLogedIn() async {
    try {
      final result = await _loginService.isLogedIn();
      return Right(result);
    } on MediumException catch (e) {
      return Left(MediumFailure(message: e.message));
    } catch (e) {
      return Left(MediumFailure(message: 'Error'));
    }
  }

  @override
  Future<Either<Failure, void>> login(String email, String password) async {
    try {
      final result = await _loginService.login(email, password);
      return const Right(null);
    } on MediumException catch (e) {
      return Left(MediumFailure(message: e.message));
    } catch (e) {
      return Left(MediumFailure(message: 'Error'));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await _loginService.logout();
      return const Right(null);
    } on MediumException catch (e) {
      return Left(MediumFailure(message: e.message));
    } catch (e) {
      return Left(MediumFailure(message: 'Error'));
    }
  }
}
