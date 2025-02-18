import 'package:desktop_math/core/consts.dart';
import 'package:desktop_math/features/add_teacher/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel(
      {required super.id,
      required super.name,
      required super.email,
      required super.phoneNumber,
      required super.fatherName,
      required super.motherName});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json[AppFields.id],
      name: json[AppFields.name],
      email: json[AppFields.email],
      phoneNumber: json[AppFields.phoneNumber],
      fatherName: json[AppFields.fatherName],
      motherName: json[AppFields.motherName],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      AppFields.id: id,
      AppFields.name: name,
      AppFields.email: email,
      AppFields.phoneNumber: phoneNumber,
      AppFields.fatherName: fatherName,
      AppFields.motherName: motherName,
    };
  }
}
