import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:projeto_piloto/domain/error/failure.dart';

import '../authentication_repository.dart';
import '../use_case.dart';

class SignInWithGoogle implements UseCase<void, NoParams> {
  final AuthenticationRepository repository;

  SignInWithGoogle({required this.repository});

  @override
  Future<Either<Failure, void>> call(NoParams noParams) async =>
      await repository.authenticateWithGoogle();
}
