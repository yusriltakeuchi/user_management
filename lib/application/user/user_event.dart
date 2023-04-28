
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_event.freezed.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.getUsers() = GetUsers;
  const factory UserEvent.loadMore() = LoadMore;
}