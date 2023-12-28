
import 'package:json_annotation/json_annotation.dart';

import '../model/destination_api_model.dart';


part 'get_destination_by_id.g.dart';

@JsonSerializable()
class GetDestinationByIdDTO {
  final bool success;
  final List<DestinationApiModel> data;

  GetDestinationByIdDTO({
    required this.success,
    required this.data,
  });

  factory GetDestinationByIdDTO.fromJson(Map<String, dynamic> json) =>
      _$GetDestinationByIdDTOFromJson(json);

  Map<String, dynamic> toJson() => _$GetDestinationByIdDTOToJson(this);
}
