// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_destination_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllDestinationDTO _$GetAllDestinationDTOFromJson(
        Map<String, dynamic> json) =>
    GetAllDestinationDTO(
      success: json['success'] as bool,
      count: json['count'] as int,
      data: (json['data'] as List<dynamic>)
          .map((e) => DestinationApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllDestinationDTOToJson(
        GetAllDestinationDTO instance) =>
    <String, dynamic>{
      'success': instance.success,
      'count': instance.count,
      'data': instance.data,
    };
