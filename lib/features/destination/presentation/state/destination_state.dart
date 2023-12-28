import 'package:trip_planner/features/destination/domain/entity/destination_entity.dart';

class DestinationState {
  final bool isLoading;
  final List<DestinationEntity> destinations;
  final List<DestinationEntity>? singleDestination;
  final String? error;
  final String? imageName;

  DestinationState({
    required this.destinations,
    required this.isLoading,
    this.singleDestination,
    this.error,
    this.imageName,
  });

  factory DestinationState.initial() {
    return DestinationState(
      isLoading: false,
      destinations: [],
      singleDestination: [],
      imageName: null,
    );
  }

  DestinationState copyWith({
    bool? isLoading,
    List<DestinationEntity>? destinations,
    List<DestinationEntity>? singleDestination,
    String? error,
    String? imageName,
  }) {
    return DestinationState(
      isLoading: isLoading ?? this.isLoading,
      destinations: destinations ?? this.destinations,
      singleDestination: singleDestination ?? this.singleDestination,
      error: error ?? this.error,
      imageName: imageName ?? this.imageName,
    );
  }
}
