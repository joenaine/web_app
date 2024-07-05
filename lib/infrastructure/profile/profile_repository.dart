import 'package:desoto_web/core/firebase_consts.dart';
import 'package:desoto_web/domain/profile/user_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class ProfileRepository {
  Future<UserModel?> getProfile({required String id}) async {
    try {
      return await firestore.collection('users').doc(id).get().then((result) {
        return UserModel.fromMap(result.data()!);
      });
    } catch (e) {}
    return null;
  }
}
