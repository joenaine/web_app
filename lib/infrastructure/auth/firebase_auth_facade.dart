import 'package:dartz/dartz.dart';
import 'package:desoto_web/domain/auth/auth_failure.dart';
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

  @override
  Future<Option<User>> getSignedInUser() async =>
      optionOf(_firebaseAuth.currentUser?.toDomain());

  @override
  Future<Either<AuthFailure, Unit>> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return left(const AuthFailure.cancelledByUser());
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
        return left(const AuthFailure.networkError());
      } else {
        print("AUTH_ERROR: $e");
        return left(const AuthFailure.serverError());
      }
    }
  }

  @override
  Future<void> signOut() => Future.wait([
        _googleSignIn.signOut(),
        _firebaseAuth.signOut(),
      ]);

  @override
  Future<Either<AuthFailure, Unit>> linkAccountWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return left(const AuthFailure.cancelledByUser());
      } else {
        final googleAuthentication = await googleUser.authentication;

        final authCredential = auth.GoogleAuthProvider.credential(
          idToken: googleAuthentication.idToken,
          accessToken: googleAuthentication.accessToken,
        );
        await _firebaseAuth.currentUser!.linkWithCredential(authCredential);
        await _firebaseAuth.currentUser!
            .updateDisplayName(googleUser.displayName);
        await _firebaseAuth.currentUser!.updatePhotoURL(googleUser.photoUrl);
        return right(unit);
      }
    } on auth.FirebaseAuthException catch (e) {
      if (e.code == 'credential-already-in-use') {
        print('CREDENTIAL ALREADY USED!!');
        return left(const AuthFailure.credentialAlreadyUsed());
      }
      print('Failed with error code: ${e.code}');

      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<void> deleteAccount() => _firebaseAuth.currentUser!.delete();

  @override
  Stream<User?> watchUserChange() =>
      _firebaseAuth.userChanges().map((user) => user?.toDomain());
}
