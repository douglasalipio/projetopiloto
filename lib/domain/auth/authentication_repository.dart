import 'package:dartz/dartz.dart';
import 'package:projeto_piloto/domain/error/failure.dart';
import 'entities/auth.dart';

abstract class AuthRepository {
  Future<Either<Failure, Auth>> registerWithCredentials(String email, String password);

  Future<Either<Failure, Auth>> getAuthenticatedUser();

  Future<Either<Failure, bool>> logoutUser();

	Future<Either<Failure, bool>> authenticateWithGoogle();

	Future<Either<Failure, bool>> authenticateWithCredentials(String email, String password);
}
