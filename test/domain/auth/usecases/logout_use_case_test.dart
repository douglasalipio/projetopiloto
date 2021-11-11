import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:projeto_piloto/domain/auth/authentication_repository.dart';
import 'package:projeto_piloto/domain/auth/use_case.dart';
import 'package:projeto_piloto/domain/auth/usecases/logout_use_case.dart';
import 'package:projeto_piloto/domain/error/failure.dart';

import 'logout_use_case_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  late final AuthRepository mockAuthRepository;
  late final LogoutUseCase logoutUseCase;

  setUpAll(() {
    mockAuthRepository = MockAuthRepository();
    logoutUseCase = LogoutUseCase(repository: mockAuthRepository);
  });

  group('Group', () {
    test('should return success when logout', () async {
      // arrange
      when(mockAuthRepository.logoutUser())
          .thenAnswer((_) async => Right(true));
      // act
      final result = await logoutUseCase.call(NoParams());
      // assert
      expect(result, Right(true));
      verify(mockAuthRepository.logoutUser());
    });

    test('should thrown an error when logout and return fail', () async {
      // arrange
      when(mockAuthRepository.logoutUser())
          .thenAnswer((_) async => Left(ServerFailure()));
      // act
      final result = await logoutUseCase.call(NoParams());
      // assert
      expect(result, Left(ServerFailure()));
      verify(mockAuthRepository.logoutUser());
    });
  });
}
