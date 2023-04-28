import 'package:freezed_annotation/freezed_annotation.dart';

part 'single_state.freezed.dart';

@freezed
abstract class SingleState<T> with _$SingleState<T> {
  factory SingleState({
    required T item,
  }) = _SingleState;

  const SingleState._();
}