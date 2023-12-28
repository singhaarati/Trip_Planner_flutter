import 'package:json_annotation/json_annotation.dart';
import 'package:trip_planner/features/user/data/model/user_api_model.dart';


part 'get_user_info_dto.g.dart';

@JsonSerializable()
class GetUserInfoDTO {
  final bool success;
  final List<UserApiModel> data;

  GetUserInfoDTO({
    required this.success,
    required this.data,
  });

  Map<String, dynamic> toJson() => _$GetUserInfoDTOToJson(this);

  factory GetUserInfoDTO.fromJson(Map<String, dynamic> json) =>
      _$GetUserInfoDTOFromJson(json);
}
