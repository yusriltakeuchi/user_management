
import 'package:dartz/dartz.dart';
import 'package:user_management/domain/failure/failure.dart';
import 'package:user_management/domain/user/user_model.dart';
import 'package:user_management/infrastructure/repository/user/user_repository_interface.dart';
import 'package:user_management/infrastructure/services/user/user_service.dart';

class UserRepository implements UserRepostiroyInterface {
  UserService userService;
  UserRepository(this.userService);
  @override
  Future<Either<Failure, List<UserModel>>> getUsers({Map<String, dynamic>? param}) => userService.getUsers(param: param);

}