import 'package:dartz/dartz.dart';
import 'package:spotify/data/models/auth/create_user_request.dart';
import 'package:spotify/data/models/auth/signin_user_req.dart';
import 'package:spotify/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify/domain/repository/auth/auth.dart';
import 'package:spotify/service_locator.dart';

class AuthRepositoryImpl
    implements AuthRepository {
  @override
  Future<Either> signup(
    CreateUserRequest createUserReq,
  ) async {
    return await sl<AuthFirebaseService>().signup(
      createUserReq,
    );
  }

  @override
  Future<Either> signin(
    SigninUserRequest signinUserReq,
  ) async {
    return await sl<AuthFirebaseService>().signin(
      signinUserReq,
    );
  }
}
