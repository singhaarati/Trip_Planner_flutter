import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_planner/features/booking/data/data_source/booking_remote_data_source.dart';

import '../../../../core/failure/failure.dart';
import '../../data/repository/booking_remote_repo_impl.dart';
import '../entity/booking_entity.dart';

final bookingRepositoryProvider = Provider<IBookingRepository>(
  (ref) {
    return BookingRemoteRepositoryImpl(
        bookingRemoteDataSource: ref.read(bookingRemoteDataSourceProvider));

    // return ref.watch(bookingRemoteRepoProvider);
    // // Check for the internet
    // final internetStatus = ref.watch(connectivityStatusProvider);

    // if (ConnectivityStatus.isConnected == internetStatus) {
    //   // If internet is available then return remote repo
    //   return ref.watch(bookingRemoteRepoProvider);
    // } else {
    //   // If internet is not available then return local repo
    //   return ref.watch(bookingLocalRepoProvider);
    // }
  },
);

abstract class IBookingRepository {
  
  Future<Either<Failure, bool>> createBookingDestinationById(
      BookingEntity booking, String destinationId);

  Future<Either<Failure, List<BookingEntity>>> getAllBookings();
}
