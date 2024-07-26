import 'dart:developer';

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
      log('Fetching profile for user ID: $id');
      final result = await firestore.collection('users').doc(id).get();

      if (result.exists) {
        final data = result.data();
        log('Document data: $data');
        if (data != null) {
          final user = UserModel.fromMap(data);
          log('User profile: $user');
          return user;
        } else {
          log('Document data is null');
        }
      } else {
        log('Document does not exist');
      }
    } catch (e) {
      log('Error fetching profile: $e');
    }
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

  Future<Either<String, Unit>> setPaymentToProfile(
      {required String userId}) async {
    try {
      await firestore.collection('users').doc(userId).update({'isPayed': true});
      return right(unit);
    } catch (e) {
      return left(e.toString());
    }
  }
}
