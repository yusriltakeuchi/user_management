// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel({
    required int id,
    required String email,
    @JsonKey(name: "first_name") String? firstName,
    @JsonKey(name: "last_Name") String? lastName,
    required String avatar,
  }) = _UserModel;
  const UserModel._();

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
} 