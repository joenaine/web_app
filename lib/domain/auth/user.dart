import 'package:desoto_web/core/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required UniqueId id,
    String? username,
    required bool isAnonymous,
    String? profileImageUrl,
  }) = _User;
}
