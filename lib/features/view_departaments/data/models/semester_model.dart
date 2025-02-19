import 'package:desktop_math/core/consts.dart';
import 'package:desktop_math/features/view_departaments/domain/entities/semester_entity.dart';

class SemesterModel extends SemesterEntity {
  SemesterModel({
    required super.id,
    required super.semesterNumber,
    required super.departamentId,
  });

  factory SemesterModel.fromJson(Map<String, dynamic> json) {
    return SemesterModel(
      id: json[AppFields.id],
      semesterNumber: json[AppFields.semesterNumber],
      departamentId: json[AppFields.departamentId],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      AppFields.id: super.id,
      AppFields.semesterNumber: super.semesterNumber,
      AppFields.departamentId: super.departamentId,
    };
  }

  factory SemesterModel.fromEntity(SemesterEntity entity) {
    return SemesterModel(
      id: entity.id,
      semesterNumber: entity.semesterNumber,
      departamentId: entity.departamentId,
    );
  }
}
