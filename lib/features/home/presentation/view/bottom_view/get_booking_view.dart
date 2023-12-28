import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_planner/features/booking/presentation/viewmodel/booking_view_model.dart';

import '../../../../booking/presentation/widget/load_booking.dart';

class GetBookingView extends ConsumerStatefulWidget {
  const GetBookingView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GetBookingViewState();
}

class _GetBookingViewState extends ConsumerState<GetBookingView> {
  @override
  Widget build(BuildContext context) {
    var bookingState = ref.watch(bookingViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Bookings"),
        elevation: 0,
      ),
      body: Column(
        children: [
          Flexible(
            child: LoadBooking(
              ref: ref,
              lstBooking: bookingState.bookings,
            ),
          ),
        ],
      ),
    );
  }
}
