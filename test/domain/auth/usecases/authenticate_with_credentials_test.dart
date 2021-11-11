import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:projeto_piloto/domain/auth/usecases/authenticate_with_credentials.dart';
import 'package:projeto_piloto/domain/error/failure.dart';

import 'mock_authentication_repository.dart';

void main() {
  late final AuthenticateWithCredentials signInWithCredentials;
  late final MockAuthenticationRepository mockRepository;
  late final Params params;

  String email = "douglas@gmail.com";
  String password = "12345678";

  setUp(() {
    mockRepository = MockAuthenticationRepository();
    signInWithCredentials =
        AuthenticateWithCredentials(repository: mockRepository);
    params = Params(email, password);
  });

  test('should login with credentials', () async {
    // arrange
    when(mockRepository.authenticateWithCredentials(email,password))
        .thenAnswer((_) async => Right(true));
    // act
    final result = await signInWithCredentials.call(params);
    // assert
    verify(mockRepository.authenticateWithCredentials(email, password));
    expect(result, Right(true));
  });

  test('should return an failure from the repoistory', () async {
    // arrange
    final failure = ServerFailure();
    when(mockRepository.authenticateWithCredentials(email, password))
        .thenAnswer((_) async => Left(failure));
    // act
    final result = await signInWithCredentials.call(params);
    // assert
    expect(result, Left(failure));
    verify(mockRepository.authenticateWithCredentials(email, password));
  });
}
