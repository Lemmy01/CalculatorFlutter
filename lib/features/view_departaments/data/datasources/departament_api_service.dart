import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:desktop_math/core/consts.dart';
import 'package:desktop_math/core/errors/exceptions.dart';
import 'package:desktop_math/features/add_teacher/data/models/user_model.dart';
import 'package:desktop_math/features/view_departaments/data/models/course_model.dart';
import 'package:desktop_math/features/view_departaments/data/models/departament_model.dart';
import 'package:desktop_math/features/view_departaments/data/models/semester_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class DepartamentApiService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final User? user = FirebaseAuth.instance.currentUser!;
  Future<List<DepartamentModel>> getDepartaments() async {
    final List<DepartamentModel> departaments = [];
    try {
      final faculties = await _firestore
          .collection(AppCollections.secretaryXFaculty)
          .where(
            AppFields.secretaryId,
            isEqualTo: user!.uid,
          )
          .get();
      for (final faculty in faculties.docs) {
        final response = await _firestore
            .collection(AppCollections.departament)
            .where(
              AppFields.facultyId,
              isEqualTo: faculty.data()[AppFields.facultyId],
            )
            .get();
        for (final doc in response.docs) {
          departaments.add(DepartamentModel.fromJson(doc.data()));
        }
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

  Future<void> addCourse(CourseModel course) async {
    try {
      final ref = _firestore.collection(AppCollections.courseCollection).doc();
      course.id = ref.id;
      await ref.set(course.toMap());
    } on FirebaseException catch (e) {
      throw MediumException(runtimeType, e.message!);
    } catch (e) {
      throw MediumException(runtimeType, e.toString());
    }
  }

  Future<UserModel> getTeacherInfo(String teacherId) async {
    try {
      final response = await _firestore
          .collection(AppCollections.teacher)
          .doc(teacherId)
          .get();
      return UserModel.fromJson(response.data()!);
    } on FirebaseException catch (e) {
      throw MediumException(runtimeType, e.message!);
    } catch (e) {
      throw MediumException(runtimeType, e.toString());
    }
  }
}
