import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/rendering.dart';
import 'package:spotify/data/models/auth/create_user_request.dart';
import 'package:spotify/data/models/auth/signin_user_req.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(CreateUserRequest params);
  Future<Either> signin(
    SigninUserRequest signinUserReq,
  );
}

class AuthFirebaseServiceImpl
    extends AuthFirebaseService {
  @override
  Future<Either> signin(
    SigninUserRequest params,
  ) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: params.email,
            password: params.password,
          );
      return Right("Signin was Successful");
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'invalid-email') {
        message = "Not user found for that email";
      } else if (e.code == 'invalid-credential') {
        message = 'Wrong password';
      } else {
        print(e.message);
        message = e.message ?? "Server is down";
      }

      return Left(message);
    }
  }

  @override
  Future<Either> signup(
    CreateUserRequest params,
  ) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: params.email,
            password: params.password,
          );
      return Right("Signup was Successful");
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'weak-password') {
        message =
            "The password is provided is too weak";
      } else if (e.code ==
          'email-already-in-use') {
        message =
            'An account already exists with that email';
      } else {
        message = e.message ?? "Server is down";
      }

      return Left(message);
    }
  }
}
