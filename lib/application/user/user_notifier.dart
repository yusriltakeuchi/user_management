
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_management/application/state/list_state.dart';
import 'package:user_management/application/user/user_event.dart';
import 'package:user_management/domain/user/user_model.dart';
import 'package:user_management/infrastructure/repository/user/user_repository.dart';
import 'package:user_management/infrastructure/services/base/base_api.dart';
import 'package:user_management/infrastructure/services/user/user_service.dart';

class UserNotifier extends StateNotifier<ListState<UserModel>> {
  UserNotifier() : super(ListState<UserModel>(items: [])) {
    mapEventsToState(const GetUsers());
  }
  UserRepository userRepository = UserRepository(
    UserService(
      BaseAPI(),
    ),
  );

  void mapEventsToState(UserEvent event) {
    event.map(
      getUsers: (getUsers) async {
        state = state.copyWith(isLoading: true);
        try {
          final result = await userRepository.getUsers(
            param: {"page": state.page}
          );
          result.fold((failure) {
            state = state.copyWith(isLoading: false, items: []);
          }, (user) {
            state = state.copyWith(isLoading: false, items: user);
          });
        } catch(e, stacktrace) {
          debugPrint(e.toString());
          debugPrint(stacktrace.toString());
          if (mounted) {
            state = state.copyWith(isLoading: false, items: []);
          }
        }
      },
      loadMore: (loadMore) async {
        state = state.copyWith(isLoading: true);
        try {
          final result = await userRepository.getUsers(
            param: {"page": state.page + 1}
          );
          result.fold((failure) {
            state = state.copyWith(isLoading: false, reachedMax: true, items: state.items);
          }, (user) {
            state = state.copyWith(isLoading: false, items: state.items + user);
          });
        } catch(e, stacktrace) {
          debugPrint(e.toString());
          debugPrint(stacktrace.toString());
          if (mounted) {
            state = state.copyWith(isLoading: false, items: state.items, reachedMax: true);
          }
        }
      }
    );
  }
}