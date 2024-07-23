import 'package:firebase_auth/firebase_auth.dart';

String handleFirebaseAuthException(FirebaseAuthException error) {
  switch (error.code) {
    case 'invalid-email':
      return 'The email address is not valid.';
    case 'user-disabled':
      return 'The user corresponding to the given email has been disabled.';
    case 'user-not-found':
      return 'There is no user corresponding to the given email.';
    case 'wrong-password':
      return 'The password is invalid for the given email, or the account does not have a password set.';
    case 'email-already-in-use':
      return 'The email address is already in use by another account.';
    case 'operation-not-allowed':
      return 'The operation is not allowed. Please contact support.';
    case 'weak-password':
      return 'The password is too weak.';
    case 'too-many-requests':
      return 'We have blocked all requests from this device due to unusual activity. Try again later.';
    case 'network-request-failed':
      return 'A network error (such as timeout, interrupted connection, or unreachable host) has occurred.';
    default:
      return 'An unknown error occurred: ${error.message}';
  }
}
