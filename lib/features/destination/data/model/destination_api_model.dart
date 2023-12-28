import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:trip_planner/features/destination/domain/entity/destination_entity.dart';

part 'destination_api_model.g.dart';

final destinationApiModelProvider = Provider<DestinationApiModel>(
  (ref) => const DestinationApiModel.empty(),
);

@JsonSerializable()
class DestinationApiModel extends Equatable {
  @JsonKey(name: 'id')
  final String? destinationId;
  final String name;
  final String location;
  final String? picture;
  final String price;

  const DestinationApiModel({
    required this.destinationId,
    required this.name,
    required this.location,
    this.picture,
    required this.price,
  });

  const DestinationApiModel.empty()
      : destinationId = '',
        name = '',
        location = '',
        picture = '',
        price = '';

  factory DestinationApiModel.fromJson(Map<String, dynamic> json) =>
      _$DestinationApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$DestinationApiModelToJson(this);

  // Convert API Object to Entity
  DestinationEntity toEntity() => DestinationEntity(
        destinationId: destinationId,
        name: name,
        location: location,
        picture: picture ?? '',
        price: price,
      );

  // Convert Entity to API Object
  DestinationApiModel fromEntity(DestinationEntity entity) =>
      DestinationApiModel(
        destinationId: entity.destinationId ?? '',
        name: entity.name,
        location: entity.location,
        picture: entity.picture,
        price: entity.price,
      );

  // Convert API List to Entity List
  List<DestinationEntity> toEntityList(List<DestinationApiModel> models) =>
      models.map((model) => model.toEntity()).toList();

  // Convert AuthApiModel list to AuthEntity list
  List<DestinationEntity> listFromJson(List<DestinationApiModel> models) =>
      models.map((model) => model.toEntity()).toList();

  DestinationEntity fromJsonSingle(DestinationApiModel singleDestination) =>
      singleDestination.toEntity();

  DestinationEntity toEntityHai(DestinationApiModel model) => model.toEntity();

  @override
  List<Object?> get props => [destinationId, name, location, picture, price];
}
