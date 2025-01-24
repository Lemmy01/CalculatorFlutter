import 'package:desktop_math/core/consts.dart';
import 'package:desktop_math/features/view_departaments/domain/entities/course_entity.dart';

class CourseModel extends CourseEntity {
  const CourseModel(
      {required super.id,
      required super.teacherId,
      required super.assistentId,
      required super.title,
      required super.numberOfCourses,
      required super.courseCredits,
      required super.scheduleMap,
      required super.semesterId});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      AppFields.id: id,
      AppFields.teacherId: teacherId,
      AppFields.assistentId: assistentId,
      AppFields.title: title,
      AppFields.numberOfCourses: numberOfCourses,
      AppFields.courseCredits: courseCredits,
      AppFields.schedule: scheduleMap,
      AppFields.semester: semesterId,
    };
  }

  factory CourseModel.fromMap(Map<String, dynamic> map) {
    return CourseModel(
      id: map[AppFields.id] as String,
      teacherId: map[AppFields.teacherId] as String,
      assistentId: map[AppFields.assistentId] as String,
      title: map[AppFields.title] as String,
      numberOfCourses: map[AppFields.numberOfCourses] as int,
      courseCredits: map[AppFields.courseCredits] as int,
      semesterId: map[AppFields.semesterId] as String,
      scheduleMap: (map[AppFields.schedule] as List<dynamic>).map((e) {
        return {
          AppFields.classWhereHeld: e[AppFields.classWhereHeld],
          AppFields.classType: e[AppFields.classType],
          AppFields.dayOfWeek: e[AppFields.dayOfWeek],
          AppFields.startingHour: e[AppFields.startingHour],
          AppFields.endingHour: e[AppFields.endingHour],
          AppFields.courseFrequency: e[AppFields.courseFrequency],
        };
      }).toList(),
    );
  }
}
