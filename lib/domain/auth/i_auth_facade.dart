import 'package:dartz/dartz.dart';
import 'package:desoto_web/domain/auth/user.dart';

abstract class IAuthFacade {
  Future<Option<User>> getSignedInUser();
  Future<Either<String, Unit>> signInWithGoogle();
  Future<Either<String, Unit>> linkAccountWithGoogle();
  Future<void> deleteAccount();
  Future<void> signOut();
  Stream<User?> watchUserChange();
}
