import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_planner/features/destination/domain/entity/destination_entity.dart';

import '../../../../core/failure/failure.dart';
import '../repository/destination_repository.dart';

final destinationUsecaseProvider = Provider<DestinationUseCase>(
  (ref) => DestinationUseCase(
    destinationRepository: ref.watch(destinationRepositoryProvider),
  ),
);

class DestinationUseCase {
  final IDestinationRepository destinationRepository;

  DestinationUseCase({required this.destinationRepository});

  Future<Either<Failure, List<DestinationEntity>>> getAllDestination() {
    return destinationRepository.getAllDestination();
  }

  Future<Either<Failure, List<DestinationEntity>>> getDestinationById(
      String destinationId) {
    return destinationRepository.getDestinationById(destinationId);
  }

  Future<Either<Failure, String>> uploadPicture(File file) async {
    return await destinationRepository.uploadPicture(file);
  }

  Future<Either<Failure, bool>> createDestination(
      DestinationEntity destination) {
    return destinationRepository.createDestination(destination);
  }

Future<Either<Failure, bool>> deleteDestinationById(String destinationId) {
    return destinationRepository.deleteDestinationById(destinationId);
  }

  
}
