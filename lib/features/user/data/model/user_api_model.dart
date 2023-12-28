import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/user_entity.dart';

part 'user_api_model.g.dart';

final userApiModelProvider = Provider<UserApiModel>((ref) {
  return UserApiModel(
    fullname: '',
    email: '',
    username: '',
    password: '',
  );
});

@JsonSerializable()
class UserApiModel {
  @JsonKey(name: 'id')
  final String? userId;
  final String fullname;
  final String email;
  // final String? image;
  final String username;
  final String? password;

  UserApiModel({
    this.userId,
    required this.fullname,
    required this.email,
    // this.image,
    required this.username,
    this.password,
  });

  factory UserApiModel.fromJson(Map<String, dynamic> json) =>
      _$UserApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserApiModelToJson(this);

  // convert AuthApiModel to AuthEntity
  UserEntity toEntity() => UserEntity(
        id: userId,
        fullname: fullname,
        email: email,
        // image: image,
        username: username,
        password: password ?? '',
      );

  // Convert AuthApiModel list to AuthEntity list
  List<UserEntity> listFromJson(List<UserApiModel> models) =>
      models.map((model) => model.toEntity()).toList();

  @override
  String toString() {
    return 'UserApiModel(id: $userId, fullname: $fullname, email: $email, username: $username, password: $password)';
  }
}
