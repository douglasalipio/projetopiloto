import 'package:dartz/dartz.dart';
import 'package:projeto_piloto/data/auth/models/auth_model_to_auth_mapper.dart';
import 'package:projeto_piloto/data/auth/services/authentication_service.dart';
import 'package:projeto_piloto/domain/auth/authentication_repository.dart';
import 'package:projeto_piloto/domain/auth/entities/auth.dart';
import 'package:projeto_piloto/domain/error/exceptions.dart';
import 'package:projeto_piloto/domain/error/failure.dart';

class UserRepositoryImp extends AuthRepository {
  final AuthService authenticationService;
  final mapper = AuthModelToUserMapper();

  UserRepositoryImp({required this.authenticationService});

  @override
  Future<Either<Failure, Auth>> registerWithCredentials(
      String email, String password) async {
    try {
      final authModel = await authenticationService.signUp(email, password);
      return Right(mapper.map(authModel));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Auth>> getAuthenticatedUser() async {
    try {
      final result = await authenticationService.getAuthenticatedUser();
      if (result != null) {
        return Right(mapper.map(result));
      } else {
        return Left(ServerFailure());
      }
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> logoutUser() async {
    authenticationService.signOut();
    try {
      final result = await authenticationService.getAuthenticatedUser();
      if (result != null)
        return Right(true);
      else
        return Left(ServerFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> authenticateWithCredentials(
      String email, String password) async {
    try {
      await authenticationService.signInWithCredentials(email, password);
      return Right(true);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> authenticateWithGoogle() async {
    try {
      await authenticationService.signInWithGoogle();
      return Right(true);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
