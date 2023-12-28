import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entity/booking_entity.dart';
import '../../domain/use_case/booking_use_case.dart';
import '../state/booking_state.dart';

final bookingViewModelProvider =
    StateNotifierProvider<BookingViewModel, BookingState>(
  (ref) => BookingViewModel(ref.watch(bookingUsecaseProvider)),
);

class BookingViewModel extends StateNotifier<BookingState> {
  final BookingUseCase bookingUseCase;

  BookingViewModel(this.bookingUseCase) : super(BookingState.initial()) {
    getAllBookings();
  }

  createBookingDestinationById(
      BookingEntity booking, String destinationId) async {
    state.copyWith(isLoading: true);
    var data = await bookingUseCase.createBookingDestinationById(
        booking, destinationId);

    data.fold(
      (l) => state = state.copyWith(isLoading: false, error: l.error),
      (r) => state = state.copyWith(isLoading: false, error: null),
    );
  }

  getAllBookings() async {
    state = state.copyWith(isLoading: true);
    var data = await bookingUseCase.getAllBookings();
    state = state.copyWith(bookings: []);

    data.fold(
      (l) => state = state.copyWith(isLoading: false, error: l.error),
      (r) => state = state.copyWith(isLoading: false, bookings: r, error: null),
    );
  }
}
