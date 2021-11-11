import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:projeto_piloto/data/auth/models/auth_model.dart';
import 'package:projeto_piloto/data/auth/repositories/authentication_repository_imp.dart';
import 'package:projeto_piloto/data/auth/services/authentication_service.dart';
import 'package:projeto_piloto/domain/auth/entities/auth.dart';
import 'package:projeto_piloto/domain/error/exceptions.dart';
import 'package:projeto_piloto/domain/error/failure.dart';

import 'auth_repository_test.mocks.dart';

@GenerateMocks([AuthService])
void main() {
  late final AuthService mockAuthService;
  late final UserRepositoryImp repository;
  late final AuthModel userModel;
  late final Auth user;

  String email = "douglas@gmail.com";
  String displayName = "Douglas Mesquita";
  String profileUrl = "http://mypic.com";
  String password = "1234567";

  setUpAll(() {
    mockAuthService = MockAuthService();
    repository =
        UserRepositoryImp(authenticationService: mockAuthService);
    userModel = AuthModel(
        email: email, displayName: displayName, profileUrl: profileUrl);
    user = Auth(email, displayName, profileUrl);
  });

  group('User data source tests', () {
    test('should register an user from the server', () async {
      // arrange
      when(mockAuthService.signUp(email, password))
          .thenAnswer((_) async => userModel);
      // act
      final result =
          await repository.registerWithCredentials(email, password);
      // assert
      verify(mockAuthService.signUp(email, password));
      verifyNoMoreInteractions(mockAuthService);
      expect(result, Right(user));
    });

    test('should return a failure after creating an account', () async {
      // arrange
      when(mockAuthService.signUp(email, password))
          .thenThrow(ServerException());
      // act
      final result =
          await repository.registerWithCredentials(email, password);
      // assert
      verify(mockAuthService.signUp(email, password));
      expect(result, Left(ServerFailure()));
    });

    test('should return an user if it is logged in', () async {
      // arrange
      when(mockAuthService.getAuthenticatedUser())
          .thenAnswer((_) async => userModel);
      // act
      final result = await repository.getAuthenticatedUser();
      // assert
      verify(mockAuthService.getAuthenticatedUser());
      verifyNoMoreInteractions(mockAuthService);
      expect(result, Right(user));
    });

    test('should return a failure after creating account', () async {
      // arrange
      when(mockAuthService.getAuthenticatedUser())
          .thenThrow(ServerException());
      // act
      final result = await repository.getAuthenticatedUser();
      // assert
      verify(mockAuthService.getAuthenticatedUser());
      expect(result, Left(ServerFailure()));
    });

    test('should sign out user', () async {
      // arrange
      when(mockAuthService.getAuthenticatedUser())
          .thenAnswer((_) async => userModel);
      when(mockAuthService.signOut()).thenAnswer((_) async => true);
      // act
      final result = await repository.logoutUser();
      // assert
      verify(mockAuthService.getAuthenticatedUser());
      verify(mockAuthService.signOut());

      expect(result, Right(true));
    });

    test('should failure login with credentials', () async {
      // arrange
      when(mockAuthService.signInWithCredentials(email, password))
          .thenThrow(ServerException());
      // act
      final result =
          await repository.authenticateWithCredentials(email, password);
      // assert
      verify(mockAuthService.signInWithCredentials(email, password));
      expect(result, Left(ServerFailure()));
    });

    test('should login with google', () async {
      // arrange
      when(mockAuthService.signInWithGoogle())
          .thenAnswer((_) async => Right(true));
      // act
      final result = await repository.authenticateWithGoogle();
      // assert
      verify(mockAuthService.signInWithGoogle());
      expect(result, Right((true)));
    });

    test('should failure login with google', () async {
      // arrange
      when(mockAuthService.signInWithGoogle())
          .thenThrow(ServerException());
      // act
      final result = await repository.authenticateWithGoogle();
      // assert
      verify(mockAuthService.signInWithGoogle());
      expect(result, Left(ServerFailure()));
    });
  });
}
