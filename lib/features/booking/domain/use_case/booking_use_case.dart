import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../entity/booking_entity.dart';
import '../repository/booking_repository.dart';

final bookingUsecaseProvider = Provider<BookingUseCase>(
  (ref) => BookingUseCase(
    bookingRepository: ref.watch(bookingRepositoryProvider),
  ),
);

class BookingUseCase {
  final IBookingRepository bookingRepository;

  BookingUseCase({required this.bookingRepository});

  Future<Either<Failure, bool>> createBookingDestinationById(
      BookingEntity booking, String destinationId) {
    return bookingRepository.createBookingDestinationById(booking, destinationId);
  }

    Future<Either<Failure, List<BookingEntity>>> getAllBookings() {
      return bookingRepository.getAllBookings();
    }
    
}
