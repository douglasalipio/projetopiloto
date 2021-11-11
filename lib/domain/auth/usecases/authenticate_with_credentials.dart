import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:projeto_piloto/domain/error/failure.dart';

import '../authentication_repository.dart';
import '../use_case.dart';

class SignInWithCredentialUseCase implements UseCase<void, Params> {
  final AuthRepository repository;

  SignInWithCredentialUseCase({required this.repository});

  @override
  Future<Either<Failure, void>> call(Params params) async => await repository
      .authenticateWithCredentials(params.email, params.password);
}

class Params extends Equatable {
  final String email;
  final String password;

  Params(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}
