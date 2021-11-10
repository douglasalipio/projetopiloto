import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:projeto_piloto/domain/auth/use_case.dart';
import 'package:projeto_piloto/domain/auth/usecases/unauthorize_session.dart';
import 'package:projeto_piloto/domain/error/failure.dart';

import 'mock_authentication_repository.dart';

void main() {
  MockAuthenticationRepository mockAuthRepository =
      MockAuthenticationRepository();
  UnauthorizeSession unauthenticatedUser =
      UnauthorizeSession(repository: mockAuthRepository);

  group('Group', () {
    test('should return true when user  sign out', () async {
      // arrange
      when(mockAuthRepository.unauthorizeSession())
          .thenAnswer((_) async => Right(true));
      // act
      final result = await unauthenticatedUser.call(NoParams());
      // assert
      expect(result, Right(true));
      verify(mockAuthRepository.unauthorizeSession());
    });

    test('should return false when user  try to logged in', () async {
      // arrange
      when(mockAuthRepository.unauthorizeSession())
          .thenAnswer((_) async => Right(false));
      // act
      final result = await unauthenticatedUser.call(NoParams());
      // assert
      expect(result, Right(false));
    });
    test('should return a failure when check if user is logged in', () async {
      // arrange
      when(mockAuthRepository.unauthorizeSession())
          .thenAnswer((_) async => Left(ServerFailure()));
      // act
      final result = await unauthenticatedUser.call(NoParams());
      // assert
      expect(result, Left(ServerFailure()));
    });
  });
}
