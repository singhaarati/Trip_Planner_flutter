import 'package:json_annotation/json_annotation.dart';

import '../model/destination_api_model.dart';

part 'get_all_destination_dto.g.dart';

@JsonSerializable()
class GetAllDestinationDTO {
  final bool success;
  final int count;
  final List<DestinationApiModel> data;

  GetAllDestinationDTO({
    required this.success,
    required this.count,
    required this.data,
  });

  Map<String, dynamic> toJson() => _$GetAllDestinationDTOToJson(this);

  factory GetAllDestinationDTO.fromJson(Map<String, dynamic> json) =>
      _$GetAllDestinationDTOFromJson(json);
}
