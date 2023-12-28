import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:trip_planner/features/destination/domain/entity/destination_entity.dart';

Future<List<DestinationEntity>> getDestinationListTest() async {
  final response =
      await rootBundle.loadString('test_data/destination_test_data.json');
  final jsonList = await json.decode(response);
  final List<DestinationEntity> destinationList = jsonList
      .map<DestinationEntity>(
        (json) => DestinationEntity.fromJson(json),
      )
      .toList();

  return Future.value(destinationList);
}
