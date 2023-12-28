import 'package:trip_planner/features/user/domain/entity/user_entity.dart';

class UserState {
  final bool isLoading;
  final String? error;
  final String? imageName;
  final List<UserEntity>? users;

  UserState({required this.isLoading, this.error, this.imageName, this.users});

  factory UserState.initial() {
    return UserState(isLoading: false, error: null, imageName: null, users: []);
  }

  UserState copyWith({
    bool? isLoading,
    String? error,
    String? imageName,
    List<UserEntity>? users,
  }) {
    return UserState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      imageName: imageName ?? this.imageName,
      users: users ?? this.users,
    );
  }

  @override
  String toString() =>
      'UserState(isLoading: $isLoading, error: $error, users: $users)';
}
