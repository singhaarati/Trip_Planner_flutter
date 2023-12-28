import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:trip_planner/features/destination/data/model/destination_api_model.dart';

import '../../../../config/constants/api_endpoint.dart';
import '../../../../config/constants/hive_table_constant.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/network/remote/http_service.dart';
import '../../../../core/shared_prefs/user_shared_prefs.dart';
import '../../../user/data/model/user_api_model.dart';
import '../../domain/entity/destination_entity.dart';
import '../dto/get_all_destination_dto.dart';
import '../dto/get_destination_by_id.dart';
import '../model/destination_hive_model.dart';

final destinationRemoteDataSourceProvider = Provider(
  (ref) => DestinationRemoteDataSource(
      dio: ref.read(httpServiceProvider),
      userSharedPrefs: ref.read(userSharedPrefsProvider),
      destinationApiModel: ref.read(destinationApiModelProvider),
      userApiModel: ref.read(userApiModelProvider),
      destinationHiveModel: ref.read(destinationHiveModelProvider)),
);

class DestinationRemoteDataSource {
  final Dio dio;
  final UserSharedPrefs userSharedPrefs;
  final UserApiModel userApiModel;
  final DestinationApiModel destinationApiModel;
  final DestinationHiveModel destinationHiveModel;

  DestinationRemoteDataSource(
      {required this.userSharedPrefs,
      required this.dio,
      required this.userApiModel,
      required this.destinationApiModel,
      required this.destinationHiveModel});

  Future<Either<Failure, List<DestinationEntity>>> getAllDestination() async {
    try {
      String? token;
      await userSharedPrefs
          .getUserToken()
          .then((value) => value.fold((l) => null, (r) => token = r!));
      var response = await dio.get(ApiEndpoints.getAllDestination,
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
            },
          ));

      if (response.statusCode == 200) {
        // print(response.data);
        GetAllDestinationDTO destinationAddDTO =
            GetAllDestinationDTO.fromJson(response.data);

        List<DestinationEntity> destination =
            destinationApiModel.toEntityList(destinationAddDTO.data);

        var directory = await getApplicationDocumentsDirectory();

        Hive.init(directory.path);
        Hive.registerAdapter(DestinationHiveModelAdapter());
        final box = await Hive.openBox(HiveTableConstant.destinationBox);
        box.clear();
        final hivedestination = destinationHiveModel.toModelList(destination);
        box.addAll(hivedestination);

        box.close();

        return Right(destinationApiModel.toEntityList(destinationAddDTO.data));
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

  // Get destionation by destinationId
  Future<Either<Failure, List<DestinationEntity>>> getDestinationById(
      String destinationId) async {
    try {
      // get token
      String? token;
      await userSharedPrefs
          .getUserToken()
          .then((value) => value.fold((l) => null, (r) => token = r!));

      var response =
          await dio.get(ApiEndpoints.getDestinationById + destinationId,
              options: Options(
                headers: {
                  'Authorization': 'Bearer $token',
                },
              ));
      if (response.statusCode == 200) {
        GetDestinationByIdDTO getDestinationDTO =
            GetDestinationByIdDTO.fromJson(response.data);

        return Right(destinationApiModel.listFromJson(getDestinationDTO.data));
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

  // Upload image using multipart
  Future<Either<Failure, String>> uploadPicture(File image) async {
    try {
      String fileName = image.path.split('/').last;
      FormData formData = FormData.fromMap(
        {
          'photo': await MultipartFile.fromFile(
            image.path,
            filename: fileName,
          ),
        },
      );

      Response response = await dio.post(
        ApiEndpoints.uploadImage,
        data: formData,
      );

      return Right(response.data['data']);
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.error.toString(),
          statusCode: e.response?.statusCode.toString() ?? '0',
        ),
      );
    }
  }

  Future<Either<Failure, bool>> createDestination(
      DestinationEntity destination) async {
    try {
      String? token;
      await userSharedPrefs
          .getUserToken()
          .then((value) => value.fold((l) => null, (r) => token = r!));

      var response = await dio.post(ApiEndpoints.createDestination,
          options: Options(
            headers: {'Authorization': 'Bearer $token'},
          ),
          data: {
            "name": destination.name,
            "location": destination.location,
            "price": destination.price,
            "picture": destination.picture
          });

      if (response.statusCode == 201) {
        return const Right(true);
      } else {
        return Left(
          Failure(
            error: response.data['message'],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.message.toString(),
        ),
      );
    }
  }

  Future<Either<Failure, bool>> deleteDestinationById(
      String destinationId) async {
    try {
      // Get the token from shared prefs
      String? token;
      var data = await userSharedPrefs.getUserToken();
      data.fold(
        (l) => token = null,
        (r) => token = r!,
      );

      Response response = await dio.delete(
        ApiEndpoints.deleteDestinationById + destinationId,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
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
}
