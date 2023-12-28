import 'package:trip_planner/features/destination/domain/entity/destination_entity.dart';
import 'package:trip_planner/features/user/domain/entity/user_entity.dart';

import '../../domain/entity/booking_entity.dart';

class BookingState {
  final bool isLoading;
  final List<BookingEntity> bookings;
  final List<UserEntity>? users;
  final List<DestinationEntity> destinations;
  final String? error;

  BookingState({
    required this.bookings,
    required this.destinations,
    required this.isLoading,
    this.users,
    this.error,
  });

  factory BookingState.initial() {
    return BookingState(
      isLoading: false,
      bookings: [],
      destinations: [],
      users: [],
    );
  }

  BookingState copyWith({
    bool? isLoading,
    List<BookingEntity>? bookings,
    List<DestinationEntity>? destinations,
    List<UserEntity>? users,
    String? error,
  }) {
    return BookingState(
      isLoading: isLoading ?? this.isLoading,
      bookings: bookings ?? this.bookings,
      users: users ?? this.users,
      destinations: destinations ?? this.destinations,
      error: error ?? this.error,
    );
  }
}
