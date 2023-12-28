import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_planner/features/destination/domain/entity/destination_entity.dart';

import '../../../../config/router/app_route.dart';
import '../../../../core/common/snackbar/my_snackbar.dart';
import '../../domain/use_case/destination_usecase.dart';
import '../state/destination_state.dart';

final destinationViewModelProvider =
    StateNotifierProvider<DestinationViewModel, DestinationState>(
  (ref) => DestinationViewModel(ref.watch(destinationUsecaseProvider)),
);

class DestinationViewModel extends StateNotifier<DestinationState> {
  final DestinationUseCase destinationUseCase;

  DestinationViewModel(this.destinationUseCase)
      : super(DestinationState.initial()) {
    getAllDestination();
  }

  createDestination(DestinationEntity destination) async {
    state.copyWith(isLoading: true);
    var data = await destinationUseCase.createDestination(destination);

    data.fold(
      (l) => state = state.copyWith(isLoading: false, error: l.error),
      (r) => state = state.copyWith(isLoading: false, error: null),
    );
  }

  getAllDestination() async {
    state = state.copyWith(isLoading: true);
    var data = await destinationUseCase.getAllDestination();
    state = state.copyWith(destinations: []);

    data.fold(
      (l) => state = state.copyWith(isLoading: false, error: l.error),
      (r) => state =
          state.copyWith(isLoading: false, destinations: r, error: null),
    );
  }

  getDestinationById(BuildContext context, String destinationId) async {
    state = state.copyWith(isLoading: true);
    var data = await destinationUseCase.getDestinationById(destinationId);

    data.fold(
      (l) => state = state.copyWith(isLoading: false, error: l.error),
      (r) {
        state =
            state.copyWith(isLoading: false, singleDestination: r, error: null);
        Navigator.pushNamed(context, AppRoute.destinationUserRoute);
      },
    );
  }

  Future<void> uploadImage(File? file) async {
    state = state.copyWith(isLoading: true);
    var data = await destinationUseCase.uploadPicture(file!);
    data.fold(
      (l) {
        state = state.copyWith(isLoading: false, error: l.error);
      },
      (imageName) {
        state = state.copyWith(
          isLoading: false,
          error: null,
          imageName: imageName,
        );
      },
    );
  }

  Future<void> deleteDestinationById(
      BuildContext context, DestinationEntity destination) async {
    state.copyWith(isLoading: true);
    var data = await destinationUseCase
        .deleteDestinationById(destination.destinationId!);

    data.fold(
      (l) {
        showSnackBar(message: l.error, context: context, color: Colors.red);

        state = state.copyWith(isLoading: false, error: l.error);
      },
      (r) {
        state.destinations.remove(destination);
        state = state.copyWith(isLoading: false, error: null);
        showSnackBar(
          message: 'destination delete successfully',
          context: context,
        );
      },
    );
  }
}
