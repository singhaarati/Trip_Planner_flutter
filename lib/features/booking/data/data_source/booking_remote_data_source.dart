import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/constants/api_endpoint.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/network/remote/http_service.dart';
import '../../../../core/shared_prefs/user_shared_prefs.dart';
import '../../../user/data/model/user_api_model.dart';
import '../../domain/entity/booking_entity.dart';
import '../dto/get_all_booking_dto.dart';
import '../model/booking_api_model.dart';

final bookingRemoteDataSourceProvider = Provider(
  (ref) => BookingRemoteDataSource(
    dio: ref.read(httpServiceProvider),
    bookingApiModel: ref.read(bookingApiModelProvider),
    userSharedPrefs: ref.read(userSharedPrefsProvider),
    userApiModel: ref.read(userApiModelProvider),
  ),
);

class BookingRemoteDataSource {
  final Dio dio;
  final BookingApiModel bookingApiModel;
  final UserApiModel userApiModel;
  final UserSharedPrefs userSharedPrefs;

  BookingRemoteDataSource({
    required this.dio,
    required this.bookingApiModel,
    required this.userApiModel,
    required this.userSharedPrefs,
  });

  Future<Either<Failure, bool>> createBookingDestinationById(
      BookingEntity booking, String destinationId) async {
    try {
      // Get the token from shared prefs
      String? token;
      var data = await userSharedPrefs.getUserToken();
      data.fold(
        (l) => token = null,
        (r) => token = r!,
      );

      Response response = await dio
          .post(ApiEndpoints.createBookingDestinationById + destinationId,
              options: Options(
                headers: {
                  'Authorization': 'Bearer $token',
                },
              ),
              data: {
            "fullname": booking.fullname,
            "email": booking.email,
            "date": booking.date,
            "time": booking.time,
            "people": booking.people
          });
      if (response.statusCode == 200) {
        return const Right(true);
      } else {
        return Left(
          Failure(
            error: response.data["message"],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.error.toString(),
          statusCode: e.response?.statusCode.toString() ?? '0',
        ),
      );
    }
  }

  Future<Either<Failure, List<BookingEntity>>> getAllBookings() async {
    try {
      String? token;
      await userSharedPrefs
          .getUserToken()
          .then((value) => value.fold((l) => null, (r) => token = r!));

      var response = await dio.get(ApiEndpoints.getAllBookings,
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
            },
          ));

      if (response.statusCode == 200) {
        // print(response.data);
        GetAllBookingsDTO getAllBookingsDTO =
            GetAllBookingsDTO.fromJson(response.data);
        return Right(bookingApiModel.toEntityList(getAllBookingsDTO.data));
      } else {
        return Left(
          Failure(
            error: response.statusMessage.toString(),
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.error.toString(),
        ),
      );
    }
  }
}
