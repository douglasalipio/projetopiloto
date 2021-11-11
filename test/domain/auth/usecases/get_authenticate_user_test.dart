import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:projeto_piloto/data/auth/models/auth_model.dart';
import 'package:projeto_piloto/domain/auth/authentication_repository.dart';
import 'package:projeto_piloto/domain/auth/use_case.dart';
import 'package:projeto_piloto/domain/auth/usecases/get_authenticate_user.dart';
import 'package:projeto_piloto/domain/error/failure.dart';
import 'logout_use_case_test.mocks.dart';

void main() {

  late final GetAuthentication getUser;
  late final AuthRepository mockAuthRepository;

  setUpAll(() {
    mockAuthRepository = MockAuthRepository();
    getUser = GetAuthentication(repository: mockAuthRepository);
  });

  group('Group', () {
    test('should return user when user is logged', () async {
      // arrange
      final userModel =
          AuthModel(email: "email", profileUrl: "url", displayName: "name");
      when(mockAuthRepository.getAuthenticatedUser())
          .thenAnswer((_) async => Right(userModel));
      // act
      final result = await getUser.call(NoParams());
      // assert
      expect(result, Right(userModel));
      verify(mockAuthRepository.getAuthenticatedUser());
      verifyNoMoreInteractions(mockAuthRepository);
    });

    test('should thrown an error when get a user', () async {
      // arrange
      when(mockAuthRepository.getAuthenticatedUser())
          .thenAnswer((_) async => Left(ServerFailure()));
      // act
      final result = await getUser.call(NoParams());
      // assert
      expect(result, Left(ServerFailure()));
      verify(mockAuthRepository.getAuthenticatedUser());
      verifyNoMoreInteractions(mockAuthRepository);
    });
  });
}
