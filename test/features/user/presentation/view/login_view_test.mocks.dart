// Mocks generated by Mockito 5.4.2 from annotations
// in trip_planner/test/features/user/presentation/view/login_view_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:trip_planner/core/failure/failure.dart' as _i5;
import 'package:trip_planner/features/user/domain/entity/user_entity.dart'
    as _i6;
import 'package:trip_planner/features/user/domain/use_case/user_usecase.dart'
    as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [UserUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserUseCase extends _i1.Mock implements _i3.UserUseCase {
  @override
  _i4.Future<_i2.Either<_i5.Failure, bool>> signupUser(_i6.UserEntity? user) =>
      (super.noSuchMethod(
        Invocation.method(
          #signupUser,
          [user],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, bool>>.value(
            _FakeEither_0<_i5.Failure, bool>(
          this,
          Invocation.method(
            #signupUser,
            [user],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, bool>>.value(
                _FakeEither_0<_i5.Failure, bool>(
          this,
          Invocation.method(
            #signupUser,
            [user],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, bool>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, bool>> loginUser(
    String? username,
    String? password,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #loginUser,
          [
            username,
            password,
          ],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, bool>>.value(
            _FakeEither_0<_i5.Failure, bool>(
          this,
          Invocation.method(
            #loginUser,
            [
              username,
              password,
            ],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, bool>>.value(
                _FakeEither_0<_i5.Failure, bool>(
          this,
          Invocation.method(
            #loginUser,
            [
              username,
              password,
            ],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, bool>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.UserEntity>>> getUserInfo() =>
      (super.noSuchMethod(
        Invocation.method(
          #getUserInfo,
          [],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, List<_i6.UserEntity>>>.value(
                _FakeEither_0<_i5.Failure, List<_i6.UserEntity>>(
          this,
          Invocation.method(
            #getUserInfo,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, List<_i6.UserEntity>>>.value(
                _FakeEither_0<_i5.Failure, List<_i6.UserEntity>>(
          this,
          Invocation.method(
            #getUserInfo,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i6.UserEntity>>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, bool>> updateUserById(
          _i6.UserEntity? user) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateUserById,
          [user],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, bool>>.value(
            _FakeEither_0<_i5.Failure, bool>(
          this,
          Invocation.method(
            #updateUserById,
            [user],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, bool>>.value(
                _FakeEither_0<_i5.Failure, bool>(
          this,
          Invocation.method(
            #updateUserById,
            [user],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, bool>>);
}