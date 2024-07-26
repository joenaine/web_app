import 'dart:convert';

class UserModel {
  final String? id;
  final String? name;
  final String? email;
  final List<int>? savedTasks;
  final bool? isPayed;

  UserModel({this.id, this.name, this.email, this.savedTasks, this.isPayed});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (name != null) {
      result.addAll({'name': name});
    }
    if (email != null) {
      result.addAll({'email': email});
    }
    if (savedTasks != null) {
      result.addAll({'savedTasks': savedTasks});
    }
    if (isPayed != null) {
      result.addAll({'isPayed': isPayed});
    }

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String?,
      name: map['name'] as String?,
      email: map['email'] as String?,
      savedTasks: map['savedTasks'] != null
          ? List<int>.from(map['savedTasks'] as List)
          : null,
      isPayed: map['isPayed'] as bool?,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
