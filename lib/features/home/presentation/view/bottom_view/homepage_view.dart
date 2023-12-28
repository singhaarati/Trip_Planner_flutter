import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_planner/features/destination/presentation/viewmodel/destination_view_model.dart';
import 'package:trip_planner/features/home/presentation/widget/destination_widget.dart';

import '../../../../../core/common/provider/is_dark_theme.dart';
import '../../../../../core/common/snackbar/my_snackbar.dart';
import '../../../data/model/shake_sensor_view.dart';
import '../../viewmodel/home_viewmodel.dart';

class HomePageView extends ConsumerStatefulWidget {
  const HomePageView({super.key});

  @override
  ConsumerState<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends ConsumerState<HomePageView> {
  late bool isDark;
  late ShakeSensor shakeSensor;
  @override
  void initState() {
    isDark = ref.read(isDarkThemeProvider);
    shakeSensor = ShakeSensor(onShake: _onShake);
    super.initState();
  }

  void _onShake() {
    setState(() {
      isDark = !isDark;
    });

    ref.read(isDarkThemeProvider.notifier).updateTheme(isDark);
  }

  @override
  Widget build(BuildContext context) {
    var destinationState = ref.watch(destinationViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () {
              showSnackBar(message: 'Refressing...', context: context);
              ref
                  .read(destinationViewModelProvider.notifier)
                  .getAllDestination();
            },
            icon: const Icon(
              Icons.refresh,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              ref.read(homeViewModelProvider.notifier).logout(context);
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
          Switch(
              value: isDark,
              onChanged: (value) {
                setState(() {
                  isDark = value;
                });
                ref.read(isDarkThemeProvider.notifier).updateTheme(value);
              }),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Explore new destinations',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // TextFormField(
              //   decoration: const InputDecoration(
              //     hintText: "search your destination",
              //     prefixIcon: Icon(Icons.search),
              //     enabledBorder: InputBorder.none,
              //     focusedBorder: InputBorder.none,
              //   ),
              // ),
              const SizedBox(
                height: 10,
              ),
              Flexible(
                child: DestinationWidget(
                    ref: ref, destinationList: destinationState.destinations),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
