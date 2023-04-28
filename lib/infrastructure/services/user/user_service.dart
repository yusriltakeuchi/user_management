
import 'package:dartz/dartz.dart';
import 'package:user_management/domain/base/failure/failure.dart';
import 'package:user_management/domain/base/response/api_response.dart';
import 'package:user_management/domain/user/user_model.dart';
import 'package:user_management/infrastructure/services/base/base_api.dart';

class UserService {
  BaseAPI api;
  UserService(this.api);

  Future<Either<Failure, List<UserModel>>> getUsers({Map<String, dynamic>? param}) async {
    APIResponse response = await api.get(
      api.endpoint.getUsers,
      useToken: true,
      param: param
    );
    if (response.data != null) {
      final data = (response.data?['data'] as List).map((e) {
        return UserModel.fromJson(e);
      }).toList();
      return Right(data);
    }
    return const Left(Failure.empty());
  }
}