import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:desoto_web/core/constants/task_model.dart';
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

  Future<Either<String, Unit>> addTaskToProfile(
      {required String userId, required int taskId}) async {
    try {
      await firestore.collection('users').doc(userId).update({
        'savedTasks': FieldValue.arrayUnion([taskId])
      });
      return right(unit);
    } catch (e) {
      return left(e.toString());
    }
  }
}
