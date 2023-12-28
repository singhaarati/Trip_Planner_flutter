import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_planner/check_internet.dart';
import 'package:trip_planner/config/router/app_route.dart';
import 'package:trip_planner/config/themes/app_theme.dart';

import '../proximityBrightnessControl.dart';
import 'common/provider/is_dark_theme.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkTheme = ref.watch(isDarkThemeProvider);
    return ProximityBrightnessControl(
        child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trip Planner',
      theme: AppTheme.getApplicationTheme(isDarkTheme),
      initialRoute: AppRoute.splashRoute,
      routes: AppRoute.getApplicationRoute(),
      home: const InternetCheck(),
    ));
  }
}
