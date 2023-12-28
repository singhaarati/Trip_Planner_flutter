import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_planner/core/failure/failure.dart';
import 'package:trip_planner/features/user/domain/entity/user_entity.dart';
import 'package:trip_planner/features/user/domain/repository/user_repository.dart';

final userUseCaseProvider = Provider((ref) {
  return UserUseCase(
    ref.watch(userRepositoryProvider),
  );
});

class UserUseCase {
  final IUserRepository _userRepository;

  UserUseCase(this._userRepository);

  Future<Either<Failure, bool>> signupUser(UserEntity user) async {
    return await _userRepository.signupUser(user);
  }

  Future<Either<Failure, bool>> loginUser(
      String username, String password) async {
    return await _userRepository.loginUser(username, password);
  }

  Future<Either<Failure, List<UserEntity>>> getUserInfo() {
    return _userRepository.getUserInfo();
  }

  Future<Either<Failure, bool>> updateUserById(UserEntity user) async {
    return await _userRepository.updateUserById(user);
  }
}
