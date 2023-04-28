
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_management/application/state/list_state.dart';
import 'package:user_management/application/user/user_notifier.dart';

final userProvider = StateNotifierProvider.autoDispose<UserNotifier, ListState>(
  (ref) => UserNotifier(),
);