import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/common/provider/internet_connectivity.dart';
import '../../../../core/failure/failure.dart';
import '../../data/repository/destination_local_repo_impl.dart';
import '../../data/repository/destination_remote_repo_impl.dart';
import '../entity/destination_entity.dart';

final destinationRepositoryProvider = Provider<IDestinationRepository>(
  (ref) {
    // return ref.watch(batchLocalRepoProvider);
    // // Check for the internet
    final internetStatus = ref.watch(connectivityStatusProvider);

    if (ConnectivityStatus.isConnected == internetStatus) {
      // If internet is available then return remote repo
      return ref.watch(destinationRemoteRepoProvider);
    } else {
      // If internet is not available then return local repo
      return ref.watch(destinationLocalRepoProvider);
    }
  },
);

abstract class IDestinationRepository {
  Future<Either<Failure, List<DestinationEntity>>> getAllDestination();
  Future<Either<Failure, List<DestinationEntity>>> getDestinationById(
      String destinationId);
  Future<Either<Failure, String>> uploadPicture(File file);
  Future<Either<Failure, bool>> createDestination(
      DestinationEntity destination);
  Future<Either<Failure, bool>> deleteDestinationById(String destinationId);
}
