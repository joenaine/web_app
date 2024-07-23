import 'dart:convert';

class UserModel {
  final String? id;
  final String? name;
  final String? email;
  final List<int>? savedTasks;
  UserModel({this.id, this.name, this.email, this.savedTasks});

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

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      savedTasks: List<int>.from(map['savedTasks']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
