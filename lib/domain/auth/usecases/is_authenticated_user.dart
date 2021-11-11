import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:projeto_piloto/domain/error/failure.dart';

import '../authentication_repository.dart';
import '../use_case.dart';

class IsAuthenticatedUser implements UseCase<bool, NoParams> {
  final AuthRepository repository;

  IsAuthenticatedUser({required this.repository});

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    final user =  await repository.getAuthenticatedUser();
    return user.fold(
          (failure) => Left(ServerFailure()),
          (user) => Right(user != null),
    );
  }
}
