import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

import '../../../../config/constants/hive_table_constant.dart';
import '../../domain/entity/user_entity.dart';

part 'user_hive_model.g.dart';

final userHiveModelProvider = Provider(
  (ref) => UserHiveModel.empty(),
);

@HiveType(typeId: HiveTableConstant.userTableId)
class UserHiveModel {
  @HiveField(0)
  final String userId;

  @HiveField(1)
  final String fullname;

  @HiveField(2)
  final String email;

  @HiveField(3)
  final String username;

  @HiveField(4)
  final String password;

  // Constructor
  UserHiveModel({
    String? userId,
    required this.fullname,
    required this.email,
    required this.username,
    required this.password,
  }) : userId = userId ?? const Uuid().v4();

  // empty constructor
  UserHiveModel.empty()
      : this(
          userId: '',
          fullname: '',
          email: '',
          username: '',
          password: '',
        );

  // Convert Hive Object to Entity
  UserEntity toEntity() => UserEntity(
        id: userId,
        fullname: fullname,
        email: email,
        username: username,
        password: password,
      );

  // Convert Entity to Hive Object
  UserHiveModel toHiveModel(UserEntity entity) => UserHiveModel(
        userId: const Uuid().v4(),
        fullname: entity.fullname,
        email: entity.email,
        username: entity.username,
        password: entity.password,
      );

  // Convert Entity List to Hive List
  List<UserHiveModel> toHiveModelList(List<UserEntity> entities) =>
      entities.map((entity) => toHiveModel(entity)).toList();

  @override
  String toString() {
    return 'userId: $userId, fullname: $fullname, email: $email, username: $username, password: $password';
  }
}
