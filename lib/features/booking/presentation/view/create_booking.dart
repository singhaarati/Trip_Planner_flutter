import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_planner/features/booking/domain/entity/booking_entity.dart';

import '../viewmodel/booking_view_model.dart';

class BookingView extends ConsumerStatefulWidget {
  const BookingView({super.key});

  @override
  ConsumerState<BookingView> createState() => _BookingViewState();
}

class _BookingViewState extends ConsumerState<BookingView> {
  final gap = const SizedBox(height: 8);
  TimeOfDay? time = TimeOfDay.now();
  DateTime? date = DateTime.now();
  final _fullnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _numberController = TextEditingController();
  String? destinationId;

  @override
  void didChangeDependencies() {
    destinationId = ModalRoute.of(context)?.settings.arguments as String?;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Destination'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _fullnameController,
                onChanged: (value) {},
                decoration:
                    const InputDecoration(labelText: 'enter your fullname'),
              ),
              gap,
              TextFormField(
                controller: _emailController,
                onChanged: (value) {},
                decoration:
                    const InputDecoration(labelText: 'enter your email'),
                keyboardType: TextInputType.emailAddress,
              ),
              gap,
              const Text(
                'Selects date :    ',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'RobotoCondensed Regular',
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
                onPressed: () async {
                  DateTime? newDate = await showDatePicker(
                    context: context,
                    initialDate: date!,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2025),
                  );
                  if (newDate != null) {
                    setState(() {
                      date = newDate;
                    });
                  }
                },
                child: Text(
                  '${date!.day}/${date!.month}/${date!.year}',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              gap,
              const Text(
                'Select Time :    ',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'RobotoCondensed Regular',
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () async {
                  TimeOfDay? newTime = await showTimePicker(
                    context: context,
                    initialTime: time!,
                  );
                  if (newTime != null) {
                    setState(() {
                      time = newTime;
                    });
                  }
                },
                child: Text(
                  '${time!.hour}:${time!.minute}',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              gap,
              TextFormField(
                controller: _numberController,
                onChanged: (value) {},
                decoration: const InputDecoration(
                    labelText: 'enter number of travelers'),
                keyboardType: TextInputType.number,
              ),
              gap,
              ElevatedButton(
                onPressed: () {
                  final booking = BookingEntity(
                    fullname: _fullnameController.text.trim(),
                    email: _emailController.text.trim(),
                    date: '${date!.month}/${date!.day}/${date!.year}',
                    time: '${time!.hour}:${time!.minute}',
                    people: _numberController.text.trim(),
                  );

                  ref
                      .read(bookingViewModelProvider.notifier)
                      .createBookingDestinationById(booking, destinationId!);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    'Book Now',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
