import 'package:desktop_math/features/view_departaments/domain/entities/departament_entity.dart';

class DepartamentModel extends DepartamentEntity {
  DepartamentModel({
    required super.id,
    required super.name,
    required super.facultyId,
  });

  factory DepartamentModel.fromJson(Map<String, dynamic> json) {
    return DepartamentModel(
      id: json['id'],
      name: json['Name'],
      facultyId: json['FacultateId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'Name': name,
      'FacultateId': facultyId,
    };
  }
}
