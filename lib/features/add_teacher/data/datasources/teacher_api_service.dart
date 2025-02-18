import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:desktop_math/core/consts.dart';
import 'package:desktop_math/core/errors/exceptions.dart';
import 'package:desktop_math/core/service/firebase_auth.dart';
import 'package:desktop_math/features/add_teacher/data/models/user_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class TeacherApiService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<List<UserModel>> getTeachers(String departamentId) async {
    final List<UserModel> teachers = [];
    try {
      final response = await _firestore
          .collection(AppCollections.departamentXTeacher)
          .where(
            AppFields.departamentId,
            isEqualTo: departamentId,
          )
          .get();
      for (final doc in response.docs) {
        final teacher = await _firestore
            .collection(AppCollections.teacher)
            .doc(doc[AppFields.teacherId])
            .get();
        teachers.add(UserModel.fromJson(teacher.data()!));
      }
      return teachers;
    } on FirebaseException catch (e) {
      throw MediumException(runtimeType, e.message!);
    } catch (e) {
      throw MediumException(runtimeType, e.toString());
    }
  }

  Future<void> addTeacher(
      UserModel model, String password, String departamentId) async {
    try {
      // final UserCredential user = await _auth.createUserWithEmailAndPassword(
      //     email: model.email, password: password);
      // String userId = user.user!.uid;
      String userId = await signUpWithEmail(model.email, password);
      model.id = userId;
      await _firestore
          .collection(AppCollections.teacher)
          .doc(userId)
          .set(model.toJson());

      final docRef =
          _firestore.collection(AppCollections.departamentXTeacher).doc();

      await _firestore
          .collection(AppCollections.departamentXTeacher)
          .doc(docRef.id)
          .set({
        AppFields.departamentId: departamentId,
        AppFields.teacherId: userId,
        AppFields.id: docRef.id,
      });
    } on FirebaseException catch (e) {
      throw MediumException(runtimeType, e.message!);
    } catch (e) {
      throw MediumException(runtimeType, e.toString());
    }
  }
}
