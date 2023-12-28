import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../../domain/entity/booking_entity.dart';
import '../../domain/repository/booking_repository.dart';
import '../data_source/booking_remote_data_source.dart';

final bookingRemoteRepoProvider = Provider<IBookingRepository>(
  (ref) => BookingRemoteRepositoryImpl(
    bookingRemoteDataSource: ref.read(bookingRemoteDataSourceProvider),
  ),
);

class BookingRemoteRepositoryImpl implements IBookingRepository {
  final BookingRemoteDataSource bookingRemoteDataSource;

  BookingRemoteRepositoryImpl({required this.bookingRemoteDataSource});

  @override
  Future<Either<Failure, bool>> createBookingDestinationById(
      BookingEntity booking, String destinationId) {
    return bookingRemoteDataSource.createBookingDestinationById(
        booking, destinationId);
  }

  @override
  Future<Either<Failure, List<BookingEntity>>> getAllBookings() {
    return bookingRemoteDataSource.getAllBookings();
  }
}
