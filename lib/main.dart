import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_planner/core/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //HiveService().init;
  //HiveService().deleteHive();
  runApp(const ProviderScope(
    child: App(),
  ));
}
