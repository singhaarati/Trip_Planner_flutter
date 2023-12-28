import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:trip_planner/features/booking/domain/entity/booking_entity.dart';
import 'package:trip_planner/features/booking/domain/use_case/booking_use_case.dart';
import 'package:trip_planner/features/booking/presentation/viewmodel/booking_view_model.dart';

import '../../test_data/booking_entity_test.dart';
import '../features/booking/presentation/widget/load_booking_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<BookingUseCase>(),
])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late ProviderContainer container;
  late BookingUseCase mockBookingUsecase;
  late List<BookingEntity> bookingEntity;

  setUpAll(() async {
    mockBookingUsecase = MockBookingUseCase();
    bookingEntity = await getBookingListTest();
    when(mockBookingUsecase.getAllBookings())
        .thenAnswer((_) async => const Right([]));
    container = ProviderContainer(
      overrides: [
        bookingViewModelProvider.overrideWith(
          (ref) => BookingViewModel(mockBookingUsecase),
        ),
      ],
    );
  });

  test('check booking initial state', () async {
    await container.read(bookingViewModelProvider.notifier).getAllBookings();

    final bookingState = container.read(bookingViewModelProvider);

    expect(bookingState.isLoading, false);
    expect(bookingState.bookings, isEmpty);
  });

  test('check for the list of bookings when calling getAllBookings', () async {
    when(mockBookingUsecase.getAllBookings())
        .thenAnswer((_) => Future.value(Right(bookingEntity)));

    await container.read(bookingViewModelProvider.notifier).getAllBookings();

    final bookingState = container.read(bookingViewModelProvider);

    expect(bookingState.isLoading, false);
    expect(bookingState.bookings.length, 2);
  });
}
