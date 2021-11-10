import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:projeto_piloto/domain/auth/entities/auth.dart';
import 'package:projeto_piloto/domain/auth/usecases/authenticate_with_credentials.dart';
import 'package:projeto_piloto/domain/auth/usecases/register_with_credentials.dart';
import 'package:projeto_piloto/domain/error/failure.dart';

import 'mock_authentication_repository.dart';

void main() {
  MockAuthenticationRepository mockAuthenticationRepository = MockAuthenticationRepository();
  RegisterWithCredentials registerWithCredential;
  Auth user;
  String email = "douglas@gmail.com";
  String password = "12345678";
  String profileUrl = "http://mypic.com";
  Params params;

  setUp(() {
    mockAuthenticationRepository = ;
    registerWithCredential =
        RegisterWithCredentials(repository: mockAuthenticationRepository);
    user = Auth(email, password, profileUrl);
    params = Params(email, password);
  });

  group('Register user repository tests', () {
    test('should register a user from  the repoistory', () async {
      // arrange
      when(mockAuthenticationRepository.registerWithCredentials(any, any))
          .thenAnswer((_) async => Right(user));
      // act
      final result = await registerWithCredential(params);
      // assert
      expect(result, Right(user));
      verify(mockAuthenticationRepository.registerWithCredentials(email, password));
      verifyNoMoreInteractions(mockAuthenticationRepository);
    });

    test('should return an failure from the repoistory', () async {
      // arrange
      final failure = ServerFailure();
      when(mockAuthenticationRepository.registerWithCredentials(any, any))
          .thenAnswer((_) async => Left(failure));
      // act
      final result = await registerWithCredential(Params(email, password));
      // assert
      expect(result, Left(failure));
      verify(mockAuthenticationRepository.registerWithCredentials(email, password));
      verifyNoMoreInteractions(mockAuthenticationRepository);
    });

    test('verify params property', () {
      expect('${[email, password]}', params.props.toString());
    });
  });
}