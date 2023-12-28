import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/failure/failure.dart';
import '../../domain/entity/user_entity.dart';
import '../../domain/repository/user_repository.dart';
import '../data_source/user_local_data_source.dart';


final userLocalRepositoryProvider = Provider<IUserRepository>((ref) {
  return UserLocalRepository(
    ref.read(userLocalDataSourceProvider),
  );
});

class UserLocalRepository implements IUserRepository {
  final UserLocalDataSource _userLocalDataSource;

  UserLocalRepository(this._userLocalDataSource);

  @override
  Future<Either<Failure, bool>> loginUser(String username, String password) {
    return _userLocalDataSource.loginUser(username, password);
  }

  @override
  Future<Either<Failure, bool>> signupUser(UserEntity user) {
    return _userLocalDataSource.signupUser(user);
  }
  
  @override
  Future<Either<Failure, List<UserEntity>>> getUserInfo() {
    // TODO: implement getUserInfo
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, bool>> updateUserById(UserEntity user) {
    // TODO: implement updateUserById
    throw UnimplementedError();
  }

  // @override
  // Future<Either<Failure, String>> uploadProfilePicture(File file) async {
  //   return const Right("");
  // }
}
