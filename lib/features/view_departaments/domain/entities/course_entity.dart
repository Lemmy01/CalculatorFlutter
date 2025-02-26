// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class CourseEntity extends Equatable {
  String id;
  final String teacherId;
  final String assistentId;
  final String title;
  final int numberOfCourses;
  final int courseCredits;
  final String semesterId;
  final List<Map<String, dynamic>> scheduleMap;

  CourseEntity({
    required this.id,
    required this.teacherId,
    required this.assistentId,
    required this.title,
    required this.numberOfCourses,
    required this.courseCredits,
    required this.scheduleMap,
    required this.semesterId,
  });

  @override
  List<Object?> get props => [
        id,
        teacherId,
        assistentId,
        title,
        numberOfCourses,
        courseCredits,
        scheduleMap,
        semesterId
      ];
}
