import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_planner/core/failure/failure.dart';
import 'package:trip_planner/features/user/data/data_source/user_remote_data_source.dart';
import 'package:trip_planner/features/user/domain/entity/user_entity.dart';
import 'package:trip_planner/features/user/domain/repository/user_repository.dart';

final userRemoteRepositoryProvider = Provider<IUserRepository>((ref) {
  return UserRemoteRepository(
    ref.watch(userRemoteDataSourceProvider),
  );
});

class UserRemoteRepository implements IUserRepository {
  final UserRemoteDataSource _userRemoteDataSource;

  UserRemoteRepository(this._userRemoteDataSource);

  @override
  Future<Either<Failure, bool>> signupUser(UserEntity user) {
    return _userRemoteDataSource.signupUser(user);
  }

  @override
  Future<Either<Failure, bool>> loginUser(String username, String password) {
    return _userRemoteDataSource.loginUser(username, password);
  }

  @override
  Future<Either<Failure, List<UserEntity>>> getUserInfo() {
    return _userRemoteDataSource.getUserInfo();
  }

  @override
  Future<Either<Failure, bool>> updateUserById(UserEntity user) {
    return _userRemoteDataSource.updateUserById(user);
  }
}
