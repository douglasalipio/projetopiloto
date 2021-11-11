import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:projeto_piloto/domain/auth/authentication_repository.dart';
import 'package:projeto_piloto/domain/auth/entities/auth.dart';
import 'package:projeto_piloto/domain/auth/usecases/register_with_credentials.dart';
import 'package:projeto_piloto/domain/error/failure.dart';

import 'logout_use_case_test.mocks.dart';

void main() {
  late final AuthRepository mockAuthRepository;
  late final RegisterWithCredentialUsaCase registerWithCredentialUseCase;
  late final Auth user;
  late final Params params;

  String email = "douglas@gmail.com";
  String password = "12345678";
  String profileUrl = "http://mypic.com";

  setUpAll(() {
    mockAuthRepository = MockAuthRepository();
    registerWithCredentialUseCase =
        RegisterWithCredentialUsaCase(repository: mockAuthRepository);
    user = Auth(email, password, profileUrl);
    params = Params(email, password);
  });

  group('Register user repository tests', () {
    test('should register an user from  the repository', () async {
      // arrange
      when(
          mockAuthRepository.registerWithCredentials(email, password))
          .thenAnswer((_) async => Right(user));
      // act
      final result = await registerWithCredentialUseCase(params);
      // assert
      expect(result, Right(user));
      verify(mockAuthRepository.registerWithCredentials(
          email, password));
      verifyNoMoreInteractions(mockAuthRepository);
    });

    test('should return an failure from the repository', () async {
      // arrange
      final failure = ServerFailure();
      when(
          mockAuthRepository.registerWithCredentials(email, password))
          .thenAnswer((_) async => Left(failure));
      // act
      final result = await registerWithCredentialUseCase(Params(email, password));
      // assert
      expect(result, Left(failure));
      verify(mockAuthRepository.registerWithCredentials(
          email, password));
      verifyNoMoreInteractions(mockAuthRepository);
    });

    test('verify params property', () {
      expect('${[email, password]}', params.props.toString());
    });
  });
}
