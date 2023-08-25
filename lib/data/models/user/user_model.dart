import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class UserModel {
  final int id;
  final String username;
  final String contact;
  final String email;
  final String password;
  final String avatar;
  final String profession;
  final String role;
  final String gender;

  UserModel(
      {this.id = 0,
      required this.password,
      required this.email,
      required this.avatar,
      required this.contact,
      required this.gender,
      required this.profession,
      required this.role,
      required this.username});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"] as int? ?? 0,
      username: json["username"] as String? ?? "",
      avatar: json["avatar"] as String? ?? "",
      contact: json["contact"] as String? ?? "",
      email: json["email"] as String? ?? "",
      gender: json["gender"] as String? ?? "",
      password: json["password"] as String? ?? "",
      profession: json["profession"] as String? ?? "",
      role: json["role"] as String? ?? "",
    );
  }

  UserModel copyWith({
    String? username,
    String? contact,
    String? email,
    String? password,
    String? avatar,
    String? profession,
    String? role,
    String? gender,
  }) =>
      UserModel(
        username: username ?? this.username,
        contact: contact ?? this.contact,
        email: email ?? this.email,
        password: password ?? this.password,
        avatar: avatar ?? this.avatar,
        profession: profession ?? this.profession,
        role: role ?? this.role,
        gender: gender ?? this.gender,
      );

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "contact": contact,
      "email": email,
      "password": password,
      "avatar": avatar,
      "profession": profession,
      "role": role,
      "gender": gender,
    };
  }

  @override
  String toString() {
    return '''
      username: $username,
      contact: $contact,
      email: $email,
      password: $password,
      avatar: $avatar,
      profession: $profession,
      role: $role,
      gender: $gender,
    ''';
  }

  Future<FormData> getFormData(XFile file) async {
    XFile file = XFile(avatar);
    String fileName = file.path.split("/").last;
    return FormData.fromMap({
      "username": username,
      "contact": contact,
      "gmail": email,
      "password": password,
      "profession": profession,
      "gender": gender,
      "avatar": await MultipartFile.fromFile(file.path, filename: fileName),
    });
  }
}
