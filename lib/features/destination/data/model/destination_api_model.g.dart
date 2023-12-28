// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'destination_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DestinationApiModel _$DestinationApiModelFromJson(Map<String, dynamic> json) =>
    DestinationApiModel(
      destinationId: json['id'] as String?,
      name: json['name'] as String,
      location: json['location'] as String,
      picture: json['picture'] as String?,
      price: json['price'] as String,
    );

Map<String, dynamic> _$DestinationApiModelToJson(
        DestinationApiModel instance) =>
    <String, dynamic>{
      'id': instance.destinationId,
      'name': instance.name,
      'location': instance.location,
      'picture': instance.picture,
      'price': instance.price,
    };
