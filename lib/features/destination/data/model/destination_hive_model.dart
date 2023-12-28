import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:trip_planner/features/destination/domain/entity/destination_entity.dart';
import 'package:uuid/uuid.dart';

import '../../../../config/constants/hive_table_constant.dart';

part 'destination_hive_model.g.dart';

final destinationHiveModelProvider = Provider(
  (ref) => DestinationHiveModel.empty(),
);

@HiveType(typeId: HiveTableConstant.destinationTableId)
class DestinationHiveModel {
  @HiveField(0)
  final String destinationId;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String location;

  @HiveField(3)
  final String picture;

  @HiveField(4)
  final String price;

  // empty constructor
  DestinationHiveModel.empty()
      : this(
            destinationId: '',
            name: '',
            location: '',
            picture: '',
            price: '');

  DestinationHiveModel({
    String? destinationId,
    required this.name,
    required this.location,
    required this.picture,
    required this.price,
  }) : destinationId = destinationId ?? const Uuid().v4();

  // Convert Hive Object to Entity
  DestinationEntity toEntity() => DestinationEntity(
        destinationId: destinationId,
        name: name,
        location: location,
        picture: picture,
        price: price,
      );

  // Convert Entity to Hive Object
  DestinationHiveModel toHiveModel(DestinationEntity entity) =>
      DestinationHiveModel(
        // batchId: entity.batchId,
        name: entity.name,
        location: entity.location,
        picture: entity.picture,
        price: entity.price,
      );

  // Convert model List to hive model
  List<DestinationHiveModel> toModelList(List<DestinationEntity> models) =>
      models.map((model) => toHiveModel(model)).toList();

  // Convert Hive List to Entity List
  List<DestinationEntity> toEntityList(List<DestinationHiveModel> models) =>
      models.map((model) => model.toEntity()).toList();

  @override
  String toString() {
    return 'destinationId: $destinationId, name: $name, location: $location, , picture: $picture, price: $price';
  }
}
