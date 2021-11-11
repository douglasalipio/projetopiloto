import 'package:dartz/dartz.dart';
import 'package:projeto_piloto/domain/auth/entities/auth.dart';
import 'package:projeto_piloto/domain/error/failure.dart';
import '../authentication_repository.dart';
import '../use_case.dart';

class GetAuthentication implements UseCase<Auth, NoParams> {
  final AuthRepository repository;

  GetAuthentication({required this.repository});

  @override
  Future<Either<Failure, Auth>> call(NoParams params) async =>
      await repository.getAuthenticatedUser();
}
