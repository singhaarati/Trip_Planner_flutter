// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserApiModel _$UserApiModelFromJson(Map<String, dynamic> json) => UserApiModel(
      userId: json['id'] as String?,
      fullname: json['fullname'] as String,
      email: json['email'] as String,
      username: json['username'] as String,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$UserApiModelToJson(UserApiModel instance) =>
    <String, dynamic>{
      'id': instance.userId,
      'fullname': instance.fullname,
      'email': instance.email,
      'username': instance.username,
      'password': instance.password,
    };
