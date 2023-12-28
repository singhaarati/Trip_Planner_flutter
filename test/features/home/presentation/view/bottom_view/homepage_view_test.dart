import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:trip_planner/config/router/app_route.dart';
import 'package:trip_planner/features/destination/domain/use_case/destination_usecase.dart';
import 'package:trip_planner/features/destination/presentation/viewmodel/destination_view_model.dart';

import '../../../../../unit_test/destination_unit_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<DestinationUseCase>(),
])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late DestinationUseCase mockDestinationUsecase;
  //late List<DestinationEntity> destinationEntity;

  setUpAll(() async {
    mockDestinationUsecase = MockDestinationUseCase();
    //destinationEntity = await getDestinationListTest();
  });
  testWidgets('homepage view ...', (tester) async {
    when(mockDestinationUsecase.getAllDestination())
        .thenAnswer((_) async => const Right([]));

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          destinationViewModelProvider.overrideWith(
              (ref) => DestinationViewModel(mockDestinationUsecase)),
        ],
        child: MaterialApp(
          routes: AppRoute.getApplicationRoute(),
          initialRoute: AppRoute.homeRoute,
        ),
      ),
    );

    await tester.pumpAndSettle();
    expect(find.byType(GridView), findsNWidgets(1));
  });
}
