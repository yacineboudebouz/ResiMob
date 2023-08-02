import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future loginWithEmailAndPassword(String email, String password) async {
    try {
      User user = (await firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user!;
      // ignore: unnecessary_null_comparison
      if (user != null) {
        return true;
      }
    } on FirebaseAuthException catch (e) {
      // ignore: avoid_print
      print(e);
      return e.message;
    }
  }
}
