import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_planner/core/failure/failure.dart';
import 'package:trip_planner/features/user/domain/entity/user_entity.dart';

import '../../data/repository/user_remote_repository.dart';

final userRepositoryProvider = Provider<IUserRepository>((ref) {
  //return ref.read(userLocalRepositoryProvider);
  return ref.watch(userRemoteRepositoryProvider);
});

abstract class IUserRepository {
  Future<Either<Failure, bool>> signupUser(UserEntity user);
  Future<Either<Failure, bool>> loginUser(String username, String password);
  Future<Either<Failure, List<UserEntity>>> getUserInfo();
  Future<Either<Failure, bool>> updateUserById(UserEntity user);
}
