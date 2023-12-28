import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:trip_planner/config/router/app_route.dart';
import 'package:trip_planner/features/user/domain/use_case/user_usecase.dart';
import 'package:trip_planner/features/user/presentation/viewmodel/user_view_model.dart';

import '../../../../unit_test/user_unit_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<UserUseCase>(),
])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late UserUseCase mockUserUsecase;
  late bool isLogin;

  setUpAll(() async {
    mockUserUsecase = MockUserUseCase();

    isLogin = true;
  });
  testWidgets('login test with username and password and open Navigator Page',
      (WidgetTester tester) async {
    when(mockUserUsecase.loginUser('anil123', 'anil123'))
        .thenAnswer((_) async => Future.value(Right(isLogin)));

    await tester.pumpWidget(ProviderScope(
      overrides: [
        userViewModelProvider
            .overrideWith((ref) => UserViewModel(mockUserUsecase)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Trip Planner',
        //theme: AppTheme.getApplicationTheme(bool isDark),
        initialRoute: AppRoute.loginRoute,
        routes: AppRoute.getApplicationRoute(),
      ),
    ));

    await tester.pumpAndSettle();

    //type in first textformfiled/textfiled

    await tester.enterText(find.byType(TextField).at(0), 'anil123');

    //type in second textfield
    await tester.enterText(find.byType(TextField).at(1), 'anil123');

    await tester.tap(
      find.widgetWithText(ElevatedButton, 'Login'),
    );

    await tester.pumpAndSettle();

    expect(find.text('Explore new destinations'), findsOneWidget);
  });
}
