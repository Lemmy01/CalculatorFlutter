import 'package:usv_hub_management/core/consts.dart';
import 'package:usv_hub_management/features/view_departaments/domain/entities/departament_entity.dart';

class DepartamentModel extends DepartamentEntity {
  DepartamentModel({
    required super.id,
    required super.name,
    required super.facultyId,
  });

  factory DepartamentModel.fromJson(Map<String, dynamic> json) {
    return DepartamentModel(
      id: json[AppFields.id],
      name: json[AppFields.name],
      facultyId: json[AppFields.facultyId],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      AppFields.id: id,
      AppFields.name: name,
      AppFields.facultyId: facultyId,
    };
  }
}
