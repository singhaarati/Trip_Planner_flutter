import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:trip_planner/core/failure/failure.dart';
import 'package:trip_planner/features/user/domain/entity/user_entity.dart';
import 'package:trip_planner/features/user/domain/use_case/user_usecase.dart';
import 'package:trip_planner/features/user/presentation/viewmodel/user_view_model.dart';

import 'user_unit_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<UserUseCase>(),
  MockSpec<BuildContext>(),
])
void main() {
  late UserUseCase mockUserUsecase;
  late ProviderContainer container;
  late BuildContext context;

  setUpAll(() {
    mockUserUsecase = MockUserUseCase();
    context = MockBuildContext();
    container = ProviderContainer(
      overrides: [
        userViewModelProvider.overrideWith(
          (ref) => UserViewModel(mockUserUsecase),
        )
      ],
    );
  });

  test('check for the initial state', () async {
    final userState = container.read(userViewModelProvider);
    expect(userState.isLoading, false);
  });

  test('login test with valid username and password', () async {
    when(mockUserUsecase.loginUser('anil123', 'anil123'))
        .thenAnswer((_) => Future.value(const Right(true)));
    await container
        .read(userViewModelProvider.notifier)
        .loginUser(context, 'anil123', 'anil123');

    final userState = container.read(userViewModelProvider);

    expect(userState.error, isNull);
  });

  test('login test with invalid username and password', () async {
    when(mockUserUsecase.loginUser('anil123', 'anil12345'))
        .thenAnswer((_) => Future.value(Left(Failure(error: 'Invalid'))));
    await container
        .read(userViewModelProvider.notifier)
        .loginUser(context, 'anil123', 'anil12345');

    final userState = container.read(userViewModelProvider);

    expect(userState.error, 'Invalid');
  });

  test('register test with valid user', () async {
    const user = UserEntity(
      id: null,
      fullname: 'Anil Singh',
      email: 'anil@gmail.com',
      username: 'anil',
      password: 'anil123',
    );

    when(mockUserUsecase.signupUser(user))
        .thenAnswer((_) => Future.value(const Right(true)));

    await container
        .read(userViewModelProvider.notifier)
        .signupUser(context, user);

    final userState = container.read(userViewModelProvider);

    expect(userState.error, 'Invalid');
  });

  test('register test with invalid user', () async {
    const user = UserEntity(
      id: null,
      fullname: 'Anil Singh',
      email: 'anil@gmail.com',
      username: 'anil6788',
      password: 'anil123',
    );

    when(mockUserUsecase.signupUser(user))
        .thenAnswer((_) => Future.value(const Right(true)));

    await container
        .read(userViewModelProvider.notifier)
        .signupUser(context, user);

    final userState = container.read(userViewModelProvider);

    expect(userState.error, 'Invalid');
  });

  tearDownAll(() {
    container.dispose();
  });
}
