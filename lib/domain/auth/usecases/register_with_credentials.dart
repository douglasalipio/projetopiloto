import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:projeto_piloto/domain/auth/entities/auth.dart';
import 'package:projeto_piloto/domain/error/failure.dart';
import '../authentication_repository.dart';
import '../use_case.dart';

class RegisterWithCredentialUsaCase implements UseCase<Auth, Params> {
  final AuthRepository repository;

  RegisterWithCredentialUsaCase({required this.repository});

  @override
  Future<Either<Failure, Auth>> call(Params params) async =>
      await repository.registerWithCredentials(params.email, params.password);
}

class Params extends Equatable {
  final String email;
  final String password;

  Params(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}
