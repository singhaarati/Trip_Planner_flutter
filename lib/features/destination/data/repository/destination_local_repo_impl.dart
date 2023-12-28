import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../../domain/entity/destination_entity.dart';
import '../../domain/repository/destination_repository.dart';
import '../data_source/destination_local_data_source.dart';

final destinationLocalRepoProvider = Provider<IDestinationRepository>((ref) {
  return DestinationLocalRepositoryImpl(
    destinationLocalDataSource: ref.watch(destinationLocalDataSourceProvider),
  );
});

class DestinationLocalRepositoryImpl implements IDestinationRepository {
  final DestinationLocalDataSource destinationLocalDataSource;

  DestinationLocalRepositoryImpl({
    required this.destinationLocalDataSource,
  });

  @override
  Future<Either<Failure, List<DestinationEntity>>> getAllDestination() {
    return destinationLocalDataSource.getAllDestination();
  }

  @override
  Future<Either<Failure, List<DestinationEntity>>> getDestinationById(
      String destinationId) {
    return destinationLocalDataSource.getDestinationById();
  }

  @override
  Future<Either<Failure, String>> uploadPicture(File file) {
    // TODO: implement uploadPicture
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, bool>> createDestination(DestinationEntity destination) {
    // TODO: implement createDestination
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, bool>> deleteDestinationById(String destinationId) {
    // TODO: implement deleteDestinationById
    throw UnimplementedError();
  }
}
