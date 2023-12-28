import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_planner/features/destination/domain/entity/destination_entity.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/network/local/hive_service.dart';
import '../model/destination_hive_model.dart';

// Dependency Injection using Riverpod
final destinationLocalDataSourceProvider =
    Provider<DestinationLocalDataSource>((ref) {
  return DestinationLocalDataSource(
      hiveService: ref.read(hiveServiceProvider),
      destinationHiveModel: ref.read(destinationHiveModelProvider));
});

class DestinationLocalDataSource {
  final HiveService hiveService;
  final DestinationHiveModel destinationHiveModel;

  DestinationLocalDataSource({
    required this.hiveService,
    required this.destinationHiveModel,
  });

  // Add Destination
  Future<Either<Failure, bool>> addDestination(
      DestinationEntity destination) async {
    try {
      // Convert Entity to Hive Object
      final hiveDestination = destinationHiveModel.toHiveModel(destination);
      // Add to Hive
      await hiveService.addDestination(hiveDestination);
      return const Right(true);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

  Future<Either<Failure, List<DestinationEntity>>> getAllDestination() async {
    try {
      // Get all destinations from Hive
      final destinations = await hiveService.getAllDestination();
      // Convert Hive Object to Entity
      final destinationEntities =
          destinationHiveModel.toEntityList(destinations);
      return Right(destinationEntities);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

  Future<Either<Failure, List<DestinationEntity>>> getDestinationById() async {
    try {
      // Get  destination by id from Hive
      final destinations = await hiveService.getDestinationById();
      // Convert Hive Object to Entity
      final destinationEntities =
          destinationHiveModel.toEntityList(destinations);
      return Right([destinationEntities[0]]);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }
}
