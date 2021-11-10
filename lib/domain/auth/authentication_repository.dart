import 'package:dartz/dartz.dart';
import 'package:projeto_piloto/domain/error/failure.dart';
import 'entities/auth.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, Auth>> registerWithCredentials(String email, String password);

  Future<Either<Failure, Auth>> getAuthenticatedUser();

  Future<Either<Failure, void>> unauthorizeSession();

	Future<Either<Failure, bool>> authenticateWithGoogle();

	Future<Either<Failure, bool>> authenticateWithCredentials(String email, String password);
}
