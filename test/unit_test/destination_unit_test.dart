import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:trip_planner/core/failure/failure.dart';
import 'package:trip_planner/features/destination/domain/entity/destination_entity.dart';
import 'package:trip_planner/features/destination/domain/use_case/destination_usecase.dart';
import 'package:trip_planner/features/destination/presentation/viewmodel/destination_view_model.dart';

import '../../test_data/destination_entity_test.dart';
import 'destination_unit_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<DestinationUseCase>(),
])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late ProviderContainer container;
  late DestinationUseCase mockDestinationUsecase;
  late List<DestinationEntity> destinationEntity;

  setUpAll(() async {
    mockDestinationUsecase = MockDestinationUseCase();
    destinationEntity = await getDestinationListTest();
    when(mockDestinationUsecase.getAllDestination())
        .thenAnswer((_) async => const Right([]));
    container = ProviderContainer(
      overrides: [
        destinationViewModelProvider.overrideWith(
          (ref) => DestinationViewModel(mockDestinationUsecase),
        ),
      ],
    );
  });

  test('check destination initial state', () async {
    await container
        .read(destinationViewModelProvider.notifier)
        .getAllDestination();

    final destinationState = container.read(destinationViewModelProvider);

    expect(destinationState.isLoading, false);
    expect(destinationState.destinations, isEmpty);
  });

  test('check for the list of destinations when calling getAllDestination',
      () async {
    when(mockDestinationUsecase.getAllDestination())
        .thenAnswer((_) => Future.value(Right(destinationEntity)));

    await container
        .read(destinationViewModelProvider.notifier)
        .getAllDestination();

    final destinationState = container.read(destinationViewModelProvider);

    expect(destinationState.isLoading, false);
    expect(destinationState.destinations.length, 4);
  });

  test('add destination entity and return true if successfully added',
      () async {
    when(mockDestinationUsecase.createDestination(destinationEntity[0]))
        .thenAnswer((_) => Future.value(const Right(true)));

    await container
        .read(destinationViewModelProvider.notifier)
        .createDestination(destinationEntity[0]);

    final destinationState = container.read(destinationViewModelProvider);

    expect(destinationState.error, isNull);
  });

  test('add destination entity and return false if an error occured', () async {
    when(mockDestinationUsecase.createDestination(destinationEntity[0]))
        .thenAnswer((_) => Future.value(Left(Failure(error: 'Not added'))));

    await container
        .read(destinationViewModelProvider.notifier)
        .createDestination(destinationEntity[0]);

    final destinationState = container.read(destinationViewModelProvider);

    expect(destinationState.error, isNotNull);
  });

  tearDownAll(() {
    container.dispose();
  });
}
