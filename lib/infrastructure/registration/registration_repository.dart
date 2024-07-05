import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:desoto_web/core/firebase_consts.dart';
import 'package:desoto_web/domain/auth/auth_failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class RegistrationRepository {
  Future<Either<AuthFailure, Unit>> saveUser({
    required String id,
    required String name,
    required String email,
    String? password,
  }) async {
    try {
      await firestore.collection('users').doc(id).set(
          {'id': id, 'name': name, 'password': password ?? '', 'email': email});
      return right(unit);
    } on FirebaseAuthException catch (error) {
      if (error.code == 'email-already-in-use') {
        return left(const AuthFailure.credentialAlreadyUsed());
      }
    } catch (e) {
      log(e.toString());
      return left(const AuthFailure.serverError());
    }
    return left(const AuthFailure.serverError());
  }
}
