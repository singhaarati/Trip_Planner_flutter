import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/router/app_route.dart';
import '../../../../core/common/snackbar/my_snackbar.dart';
import '../../domain/entity/user_entity.dart';
import '../../domain/use_case/user_usecase.dart';
import '../state/user_state.dart';

final userViewModelProvider =
    StateNotifierProvider<UserViewModel, UserState>((ref) {
  return UserViewModel(
    ref.watch(userUseCaseProvider),
  );
});

class UserViewModel extends StateNotifier<UserState> {
  final UserUseCase _userUseCase;

  UserViewModel(this._userUseCase) : super(UserState(isLoading: false)) {
    getUserInfo();
  }

  Future<void> signupUser(BuildContext context, UserEntity user) async {
    state = state.copyWith(isLoading: true);
    var data = await _userUseCase.signupUser(user);
    data.fold((failure) {
      state = state.copyWith(
        isLoading: false,
        error: failure.error,
      );
      showSnackBar(message: failure.error, context: context, color: Colors.red);
    }, (sucess) {
      state = state.copyWith(isLoading: false, error: null);
      showSnackBar(message: "Registered successfully", context: context);
    });
  }

  Future<void> loginUser(
      BuildContext context, String username, String password) async {
    state = state.copyWith(isLoading: true);
    var data = await _userUseCase.loginUser(username, password);
    data.fold((failure) {
      state = state.copyWith(isLoading: false, error: failure.error);
      showSnackBar(message: failure.error, context: context, color: Colors.red);
    }, (sucess) {
      state = state.copyWith(isLoading: false, error: null);
      Navigator.popAndPushNamed(context, AppRoute.homeRoute);
    });
  }

  getUserInfo() async {
    state = state.copyWith(isLoading: true);
    var data = await _userUseCase.getUserInfo();
    state = state.copyWith(users: []);

    data.fold(
      (l) => state = state.copyWith(isLoading: false, error: l.error),
      (r) => state = state.copyWith(isLoading: false, users: r, error: null),
    );
  }

  updateUserById(UserEntity user) async {
    state = state.copyWith(isLoading: true);
    var data = await _userUseCase.updateUserById(user);
    state = state.copyWith(users: []);

    data.fold(
      (l) => state = state.copyWith(isLoading: false, error: l.error),
      (r) => state = state.copyWith(isLoading: false, error: null),
    );
  }
}
