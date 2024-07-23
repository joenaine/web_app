import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:desoto_web/core/helpers/exception_helper.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:desoto_web/infrastructure/auth/firebase_user_mapper.dart';

import '../../domain/auth/user.dart';

@LazySingleton()
class FirebaseAuthFacade {
  final auth.FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  FirebaseAuthFacade(
    this._firebaseAuth,
    this._googleSignIn,
  );

  Future<Option<User>> getSignedInUser() async =>
      optionOf(_firebaseAuth.currentUser?.toDomain());

  Future<Either<String, Unit>> signUpWithEmail(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      return right(unit);
    } on auth.FirebaseAuthException catch (error) {
      log("AUTH_ERROR: $error");
      return left(handleFirebaseAuthException(error));
    } catch (e) {
      log("AUTH_ERROR: $e");
      return left(e.toString());
    }
  }

  Future<Either<String, Unit>> signInWithEmail(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      return right(unit);
    } on auth.FirebaseAuthException catch (error) {
      log('ERRORCODE: ${error.code}');
      return left(handleFirebaseAuthException(error));
    } catch (e) {
      log("AUTH_ERROR: $e");

      return left(e.toString());
    }
  }

  Future<Either<String, Unit>> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return left('Cancelled');
      } else {
        final googleAuthentication = await googleUser.authentication;

        final authCredential = auth.GoogleAuthProvider.credential(
          idToken: googleAuthentication.idToken,
          accessToken: googleAuthentication.accessToken,
        );

        await _firebaseAuth.signInWithCredential(authCredential);
        return right(unit);
      }
    } catch (e) {
      print('NETWORK_ERROR: $e ??');
      if (e.toString() ==
          "PlatformException(network_error, com.google.android.gms.common.api.ApiException: 7: , null, null)") {
        return left('Network error, check your internet connection');
      } else {
        print("AUTH_ERROR: $e");
        return left('Server error, try again later');
      }
    }
  }

  Future<void> signOut() => Future.wait([
        _googleSignIn.signOut(),
        _firebaseAuth.signOut(),
      ]);

  Future<void> deleteAccount() => _firebaseAuth.currentUser!.delete();

  Stream<User?> watchUserChange() =>
      _firebaseAuth.userChanges().map((user) => user?.toDomain());
}
