import 'package:desoto_web/core/value_objects.dart';
import 'package:desoto_web/domain/auth/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;

extension FirebaseUserDomainX on firebase.User {
  User toDomain() {
    return User(
      id: UniqueId.fromUniqueString(uid),
      username: displayName,
      profileImageUrl: photoURL,
      isAnonymous: isAnonymous,
    );
  }
}
