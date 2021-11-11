import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:projeto_piloto/data/auth/models/auth_model.dart';
import 'package:projeto_piloto/data/auth/repositories/authentication_repository_imp.dart';
import 'package:projeto_piloto/data/auth/services/authentication_service.dart';
import 'package:projeto_piloto/domain/auth/entities/auth.dart';
import 'package:projeto_piloto/domain/error/exceptions.dart';
import 'package:projeto_piloto/domain/error/failure.dart';

class MockRegisterUserDataSource extends Mock
    implements AuthenticationServiceImp {}

class FutureCallbackMock extends Mock implements Function {
  Future<void> call();
}

void main() {
  late final MockRegisterUserDataSource mockRegisterUserDataSource;
  late final UserRepositoryImp repository;
  late final AuthModel userModel;
  late final Auth user;

  String email = "douglas@gmail.com";
  String displayName = "Douglas Mesquita";
  String profileUrl = "http://mypic.com";
  String password = "1234567";

  setUp(() {
    mockRegisterUserDataSource = MockRegisterUserDataSource();
    repository =
        UserRepositoryImp(authenticationService: mockRegisterUserDataSource);
    userModel = AuthModel(
        email: email, displayName: displayName, profileUrl: profileUrl);
    user = Auth(email, displayName, profileUrl);
  });

  group('User data source tests', () {
    test('should create an user', () async {
      // arrange
      when(mockRegisterUserDataSource.signUp(email, password))
          .thenAnswer((_) async => userModel);
      // act
      final result =
          await repository.registerWithCredentials(email, displayName);
      // assert
      verify(mockRegisterUserDataSource.signUp(email, displayName));
      verifyNoMoreInteractions(mockRegisterUserDataSource);
      expect(result, Right(user));
    });

    test('should return a failure after creating account', () async {
      // arrange
      when(mockRegisterUserDataSource.signUp(email, password))
          .thenThrow(ServerException());
      // act
      final result =
          await repository.registerWithCredentials(email, displayName);
      // assert
      verify(mockRegisterUserDataSource.signUp(email, displayName));
      expect(result, Left(ServerFailure()));
    });

    test('should return an user if it is logged in', () async {
      // arrange
      when(mockRegisterUserDataSource.getAuthenticatedUser())
          .thenAnswer((_) async => userModel);
      // act
      final result = await repository.getAuthenticatedUser();
      // assert
      verify(mockRegisterUserDataSource.getAuthenticatedUser());
      verifyNoMoreInteractions(mockRegisterUserDataSource);
      expect(result, Right(user));
    });

    test('should return null if user is not logged in', () async {
      // arrange
      // when(mockRegisterUserDataSource.getAuthenticatedUser())
      //     .thenAnswer((_) async => null);
      // // act
      // final result = await repository.getAuthenticatedUser();
      // // assert
      // verify(mockRegisterUserDataSource.getAuthenticatedUser());
      // verifyNoMoreInteractions(mockRegisterUserDataSource);
      // expect(result, Right(null));
    });

    test('should return a failure after creating account', () async {
      // arrange
      when(mockRegisterUserDataSource.getAuthenticatedUser())
          .thenThrow(ServerException());
      // act
      final result = await repository.getAuthenticatedUser();
      // assert
      verify(mockRegisterUserDataSource.getAuthenticatedUser());
      expect(result, Left(ServerFailure()));
    });

    test('should sign out user', () async {
      // arrange
      when(mockRegisterUserDataSource.getAuthenticatedUser())
          .thenAnswer((_) async => userModel);
      when(mockRegisterUserDataSource.signOut()).thenAnswer((_) async => true);
      // act
      final result = await repository.unauthorizeSession();
      // assert
      verify(mockRegisterUserDataSource.getAuthenticatedUser());
      verify(mockRegisterUserDataSource.signOut());

      expect(result, Right(true));
    });

    test('should return a failure when try to sign out', () async {
      // arrange
      when(mockRegisterUserDataSource.signOut())
          .thenAnswer((_) async => Right(false));
      // act
      final result = await repository.unauthorizeSession();
      // assert
      verify(mockRegisterUserDataSource.signOut());

      expect(result, Right((false)));
    });

    test('should login with credentials', () async {
      // arrange
      // when(mockRegisterUserDataSource.signInWithCredentials(email, password))
      //     .thenAnswer((_) async => Right(true));
      // // act
      // final result =
      //     await repository.authenticateWithCredentials(email, password);
      // // assert
      // verify(mockRegisterUserDataSource.signInWithCredentials(email, password));
      // expect(result, Right((true)));
    });

    test('should failure login with credentials', () async {
      // arrange
      when(mockRegisterUserDataSource.signInWithCredentials(email, password))
          .thenThrow(ServerException());
      // act
      final result =
          await repository.authenticateWithCredentials(email, password);
      // assert
      verify(mockRegisterUserDataSource.signInWithCredentials(email, password));
      expect(result, Left(ServerFailure()));
    });

    test('should login with google', () async {
      // arrange
      when(mockRegisterUserDataSource.signInWithGoogle())
          .thenAnswer((_) async => Right(true));
      // act
      final result = await repository.authenticateWithGoogle();
      // assert
      verify(mockRegisterUserDataSource.signInWithGoogle());
      expect(result, Right((true)));
    });

    test('should failure login with google', () async {
      // arrange
      when(mockRegisterUserDataSource.signInWithGoogle())
          .thenThrow(ServerException());
      // act
      final result = await repository.authenticateWithGoogle();
      // assert
      verify(mockRegisterUserDataSource.signInWithGoogle());
      expect(result, Left(ServerFailure()));
    });
  });
}
