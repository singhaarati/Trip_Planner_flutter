import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_planner/features/booking/presentation/viewmodel/booking_view_model.dart';

import '../../domain/entity/booking_entity.dart';

class LoadBooking extends StatelessWidget {
  final WidgetRef ref;
  final List<BookingEntity> lstBooking;
  const LoadBooking({super.key, required this.lstBooking, required this.ref});

  @override
  Widget build(BuildContext context) {
    var bookingState = ref.watch(bookingViewModelProvider);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            if (bookingState.isLoading) ...{
              const CircularProgressIndicator(),
            } else if (bookingState.error != null) ...{
              Text(bookingState.error!),
            } else if (bookingState.bookings.isEmpty) ...{
              const Center(
                child: Text(
                  "No bookings yet..!!!",
                  style: TextStyle(fontSize: 25),
                ),
              ),
            } else ...{
              Expanded(
                child: ListView.builder(
                  itemCount: lstBooking.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 16,
                      ),
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              lstBooking[index].fullname,
                              style: const TextStyle(fontSize: 18),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "Date: ${lstBooking[index].date}",
                              style: const TextStyle(fontSize: 14),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Time: ${lstBooking[index].time}",
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.grey),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Email: ${lstBooking[index].email}",
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.grey),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Number of People: ${lstBooking[index].people}",
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.grey),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "BookingID: ${lstBooking[index].bookingId}",
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.grey),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Edit",
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "Delete",
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),

                      //  ListTile(
                      //   title: Text(
                      //     lstBooking[index].fullname,
                      //     style: const TextStyle(fontSize: 18),
                      //   ),
                      //   subtitle: Text(
                      //     lstBooking[index].date,
                      //     style: const TextStyle(fontSize: 14),
                      //   ),
                      // ),
                    );
                  },
                ),
              ),
            },
          ],
        ),
      ),
    );
  }
}
