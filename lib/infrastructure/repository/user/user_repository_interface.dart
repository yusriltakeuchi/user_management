
import 'package:dartz/dartz.dart';
import 'package:user_management/domain/failure/failure.dart';
import 'package:user_management/domain/user/user_model.dart';

abstract class UserRepostiroyInterface {
  Future<Either<Failure, List<UserModel>>> getUsers();
}