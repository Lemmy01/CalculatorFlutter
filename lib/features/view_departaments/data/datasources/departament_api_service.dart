import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:desktop_math/core/consts.dart';
import 'package:desktop_math/core/errors/exceptions.dart';
import 'package:desktop_math/features/view_departaments/data/models/course_model.dart';
import 'package:desktop_math/features/view_departaments/data/models/departament_model.dart';
import 'package:desktop_math/features/view_departaments/data/models/semester_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class DepartamentApiService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<List<DepartamentModel>> getDepartaments() async {
    final List<DepartamentModel> departaments = [];
    try {
      final response = _firestore.collection(AppCollections.departament).get();
      for (final doc in (await response).docs) {
        departaments.add(DepartamentModel.fromJson(doc.data()));
      }
      return departaments;
    } on FirebaseException catch (e) {
      throw MediumException(runtimeType, e.message!);
    } catch (e) {
      throw MediumException(runtimeType, e.toString());
    }
  }

  Future<List<SemesterModel>> getSemesters(String departamentId) async {
    final List<SemesterModel> semesters = [];
    try {
      final response = _firestore
          .collection(AppCollections.semesterCollection)
          .where(AppFields.departamentId, isEqualTo: departamentId)
          .get();
      for (final doc in (await response).docs) {
        semesters.add(SemesterModel.fromJson(doc.data()));
      }
      return semesters;
    } on FirebaseException catch (e) {
      throw MediumException(runtimeType, e.message!);
    } catch (e) {
      throw MediumException(runtimeType, e.toString());
    }
  }

  Future<List<CourseModel>> getCourses(String semesterId) async {
    final List<CourseModel> departaments = [];
    try {
      final response = _firestore
          .collection(AppCollections.courseCollection)
          .where(AppFields.semesterId, isEqualTo: semesterId)
          .get();
      for (final doc in (await response).docs) {
        departaments.add(CourseModel.fromMap(doc.data()));
      }
      return departaments;
    } on FirebaseException catch (e) {
      throw MediumException(runtimeType, e.message!);
    } catch (e) {
      throw MediumException(runtimeType, e.toString());
    }
  }

  Future<void> addSemester(SemesterModel semester) async {
    try {
      final ref =
          _firestore.collection(AppCollections.semesterCollection).doc();
      semester.id = ref.id;
      await ref.set(semester.toJson());
    } on FirebaseException catch (e) {
      throw MediumException(runtimeType, e.message!);
    } catch (e) {
      throw MediumException(runtimeType, e.toString());
    }
  }
}
