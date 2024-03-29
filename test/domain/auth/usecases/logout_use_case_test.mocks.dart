// Mocks generated by Mockito 5.0.16 from annotations
// in projeto_piloto/test/domain/auth/usecases/logout_use_case_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:projeto_piloto/domain/auth/authentication_repository.dart'
    as _i3;
import 'package:projeto_piloto/domain/auth/entities/auth.dart' as _i6;
import 'package:projeto_piloto/domain/error/failure.dart' as _i5;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeEither_0<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

/// A class which mocks [AuthRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthRepository extends _i1.Mock implements _i3.AuthRepository {
  MockAuthRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.Auth>> registerWithCredentials(
          String? email, String? password) =>
      (super.noSuchMethod(
              Invocation.method(#registerWithCredentials, [email, password]),
              returnValue: Future<_i2.Either<_i5.Failure, _i6.Auth>>.value(
                  _FakeEither_0<_i5.Failure, _i6.Auth>()))
          as _i4.Future<_i2.Either<_i5.Failure, _i6.Auth>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.Auth>> getAuthenticatedUser() =>
      (super.noSuchMethod(Invocation.method(#getAuthenticatedUser, []),
              returnValue: Future<_i2.Either<_i5.Failure, _i6.Auth>>.value(
                  _FakeEither_0<_i5.Failure, _i6.Auth>()))
          as _i4.Future<_i2.Either<_i5.Failure, _i6.Auth>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, bool>> logoutUser() =>
      (super.noSuchMethod(Invocation.method(#logoutUser, []),
              returnValue: Future<_i2.Either<_i5.Failure, bool>>.value(
                  _FakeEither_0<_i5.Failure, bool>()))
          as _i4.Future<_i2.Either<_i5.Failure, bool>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, bool>> authenticateWithGoogle() =>
      (super.noSuchMethod(Invocation.method(#authenticateWithGoogle, []),
              returnValue: Future<_i2.Either<_i5.Failure, bool>>.value(
                  _FakeEither_0<_i5.Failure, bool>()))
          as _i4.Future<_i2.Either<_i5.Failure, bool>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, bool>> authenticateWithCredentials(
          String? email, String? password) =>
      (super.noSuchMethod(
          Invocation.method(#authenticateWithCredentials, [email, password]),
          returnValue: Future<_i2.Either<_i5.Failure, bool>>.value(
              _FakeEither_0<_i5.Failure, bool>())) as _i4
          .Future<_i2.Either<_i5.Failure, bool>>);
  @override
  String toString() => super.toString();
}
