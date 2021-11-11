import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:projeto_piloto/domain/error/failure.dart';
import '../authentication_repository.dart';
import '../use_case.dart';

//authenticationRepository should be this class
class LogoutUseCase implements UseCase<void, NoParams> {
  final AuthRepository repository;

  LogoutUseCase({required this.repository});

  @override
  Future<Either<Failure, void>> call(NoParams params) async =>
      await repository.logoutUser();
}
