import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:desoto_web/core/firebase_consts.dart';
import 'package:desoto_web/core/helpers/exception_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class RegistrationRepository {
  Future<Either<String, Unit>> saveUser({
    required String id,
    required String name,
    required String email,
    String? password,
  }) async {
    try {
      await firestore.collection('users').doc(id).set({
        'id': id,
        'name': name,
        'password': password ?? '',
        'email': email,
        'createdDate': DateTime.now()
      });
      return right(unit);
    } on FirebaseAuthException catch (error) {
      return left(handleFirebaseAuthException(error));
    } catch (e) {
      log(e.toString());
      return left(e.toString());
    }
  }
}
