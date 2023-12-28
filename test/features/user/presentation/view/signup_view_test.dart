import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:trip_planner/config/router/app_route.dart';
import 'package:trip_planner/features/user/domain/entity/user_entity.dart';
import 'package:trip_planner/features/user/domain/use_case/user_usecase.dart';
import 'package:trip_planner/features/user/presentation/viewmodel/user_view_model.dart';

import '../../../../unit_test/user_unit_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<UserUseCase>(),
])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late UserUseCase mockUserUsecase;
  late UserEntity userEntity;

  setUpAll(
    () async {
      mockUserUsecase = MockUserUseCase();
      userEntity = const UserEntity(
        id: null,
        fullname: 'Anil Singh',
        email: 'anil@gmail.com',
        username: 'anil123',
        password: 'anil123',
      );
    },
  );

  testWidgets('SignUp test open login Page', (tester) async {
    when(mockUserUsecase.signupUser(userEntity))
        .thenAnswer((_) async => const Right(true));

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          userViewModelProvider.overrideWith(
            (ref) => UserViewModel(mockUserUsecase),
          ),
        ],
        child: MaterialApp(
          //debugShowCheckedModeBanner: false,
          //title: 'Trip Planner',
          //theme: AppTheme.getApplicationTheme(),
          initialRoute: AppRoute.signupRoute,
          routes: AppRoute.getApplicationRoute(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // Enter  first textform field fullname
    await tester.enterText(find.byType(TextFormField).at(0), 'Anil Singh');
    //enter email
    await tester.enterText(find.byType(TextFormField).at(1), 'anil@gmail.com');
    // Enter username
    await tester.enterText(find.byType(TextFormField).at(2), 'anil123');
    // Enter password
    await tester.enterText(find.byType(TextFormField).at(3), 'anil123');
    // //confirm password
    // await tester.enterText(find.byType(TextFormField).at(4), 'anil123');

    //=========================== Find the signup button ===========================
    final signUpButtonFinder = find.widgetWithText(ElevatedButton, 'Sign up');
    await tester.ensureVisible(signUpButtonFinder);

    await tester.tap(signUpButtonFinder);

    //await tester.pump(const Duration(seconds: 1));

    await tester.pumpAndSettle();

    // // Check weather the snackbar is displayed or not
    // expect(find.widgetWithText(SnackBar, 'Registered successfully'),
    //     findsOneWidget);
  });
}
