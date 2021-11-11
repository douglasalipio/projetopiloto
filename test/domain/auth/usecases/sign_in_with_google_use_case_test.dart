import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:projeto_piloto/domain/auth/authentication_repository.dart';
import 'package:projeto_piloto/domain/auth/use_case.dart';
import 'package:projeto_piloto/domain/auth/usecases/authenticate_with_google.dart';
import 'package:projeto_piloto/domain/error/failure.dart';
import 'logout_use_case_test.mocks.dart';

void main() {
  late final SignInWithGoogle signInWithGoogle;
  late final AuthRepository mockRepository;

  setUpAll(() {
    mockRepository = MockAuthRepository();
    signInWithGoogle = SignInWithGoogle(repository: mockRepository);
  });

  test('should login with Google', () async {
    // arrange
    when(mockRepository.authenticateWithGoogle())
        .thenAnswer((_) async => Right(true));
    // act
    final result = await signInWithGoogle.call(NoParams());
    // assert
    verify(mockRepository.authenticateWithGoogle());
    expect(result, Right(true));
  });

  test('should return an failure from the repository', () async {
    // arrange
    final failure = ServerFailure();
    when(mockRepository.authenticateWithGoogle())
        .thenAnswer((_) async => Left(failure));
    // act
    final result = await signInWithGoogle.call(NoParams());
    // assert
    expect(result, Left(failure));
    verify(mockRepository.authenticateWithGoogle());
  });
}
