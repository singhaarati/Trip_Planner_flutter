import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_planner/features/destination/domain/entity/destination_entity.dart';

import '../../../../core/failure/failure.dart';
import '../../domain/repository/destination_repository.dart';
import '../data_source/destination_remote_data_source.dart';

final destinationRemoteRepoProvider = Provider<IDestinationRepository>(
  (ref) => DestinationRemoteRepositoryImpl(
    destinationRemoteDataSource: ref.read(destinationRemoteDataSourceProvider),
  ),
);

class DestinationRemoteRepositoryImpl implements IDestinationRepository {
  final DestinationRemoteDataSource destinationRemoteDataSource;

  DestinationRemoteRepositoryImpl({required this.destinationRemoteDataSource});

  @override
  Future<Either<Failure, List<DestinationEntity>>> getAllDestination() {
    return destinationRemoteDataSource.getAllDestination();
  }

  @override
  Future<Either<Failure, List<DestinationEntity>>> getDestinationById(
      String destinationId) {
    return destinationRemoteDataSource.getDestinationById(destinationId);
  }

  @override
  Future<Either<Failure, String>> uploadPicture(File file) {
    return destinationRemoteDataSource.uploadPicture(file);
  }

  @override
  Future<Either<Failure, bool>> createDestination(
      DestinationEntity destination) {
    return destinationRemoteDataSource.createDestination(destination);
  }

  @override
  Future<Either<Failure, bool>> deleteDestinationById(String destinationId) {
    return destinationRemoteDataSource.deleteDestinationById(destinationId);
  }
}
