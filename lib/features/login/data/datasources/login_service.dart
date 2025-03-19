import 'package:usv_hub_management/core/errors/exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class LoginService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password);
    } on FirebaseAuthException catch (e) {
      throw MediumException(runtimeType, e.message!);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> logout() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      throw MediumException(runtimeType, e.message!);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<bool> isLogedIn() async {
    return _auth.currentUser != null;
  }
}
