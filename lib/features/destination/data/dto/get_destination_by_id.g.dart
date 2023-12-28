// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_destination_by_id.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDestinationByIdDTO _$GetDestinationByIdDTOFromJson(
        Map<String, dynamic> json) =>
    GetDestinationByIdDTO(
      success: json['success'] as bool,
      data: [(json['data'] as Map<String, dynamic>)]
          .map((e) => DestinationApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetDestinationByIdDTOToJson(
        GetDestinationByIdDTO instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
