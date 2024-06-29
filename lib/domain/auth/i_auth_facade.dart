import 'package:dartz/dartz.dart';
import 'package:desoto_web/domain/auth/auth_failure.dart';
import 'package:desoto_web/domain/auth/user.dart';

abstract class IAuthFacade {
  Future<Option<User>> getSignedInUser();
  Future<Either<AuthFailure, Unit>> signInWithGoogle();
  Future<Either<AuthFailure, Unit>> signInWithApple();
  Future<Either<AuthFailure, Unit>> signInAnonymous();
  Future<Either<AuthFailure, Unit>> linkAccountWithGoogle();
  Future<Either<AuthFailure, Unit>> linkAccountWithApple();
  Future<void> deleteAccount();
  Future<void> signOut();
  Stream<User?> watchUserChange();
}
