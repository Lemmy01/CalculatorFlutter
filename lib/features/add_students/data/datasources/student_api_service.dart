import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:desktop_math/core/consts.dart';
import 'package:desktop_math/core/errors/exceptions.dart';
import 'package:desktop_math/core/service/firebase_auth.dart';
import 'package:desktop_math/features/add_teacher/data/models/user_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class StudentApiService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<List<UserModel>> getStudents(String semesterId) async {
    final List<UserModel> students = [];
    try {
      final response = await _firestore
          .collection(AppCollections.semesterXStudentCollection)
          .where(
            AppFields.semesterId,
            isEqualTo: semesterId,
          )
          .get();
      for (final doc in response.docs) {
        final student = await _firestore
            .collection(AppCollections.student)
            .doc(doc[AppFields.studentId])
            .get();
        students.add(UserModel.fromJson(student.data()!));
      }
      return students;
    } on FirebaseException catch (e) {
      throw MediumException(runtimeType, e.message!);
    } catch (e) {
      throw MediumException(runtimeType, e.toString());
    }
  }

  Future<void> addStudent(
      UserModel model, String password, String semesterId) async {
    try {
      // final UserCredential user = await _auth.createUserWithEmailAndPassword(
      //     email: model.email, password: password);
      // String userId = user.user!.uid;
      String userId = await signUpWithEmail(model.email, password);
      model.id = userId;
      await _firestore
          .collection(AppCollections.student)
          .doc(userId)
          .set(model.toJson());

      final docRef = _firestore
          .collection(AppCollections.semesterXStudentCollection)
          .doc();

      await _firestore
          .collection(AppCollections.semesterXStudentCollection)
          .doc(docRef.id)
          .set({
        AppFields.semesterId: semesterId,
        AppFields.studentId: userId,
        AppFields.id: docRef.id,
        AppFields.isActive: true,
        //TODO: Add years of attendance
      });
    } on FirebaseException catch (e) {
      throw MediumException(runtimeType, e.message!);
    } catch (e) {
      throw MediumException(runtimeType, e.toString());
    }
  }
}
