import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthService {
  bool isUserLogged() {
    bool status = false;
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        status = false;
      } else {
        status = true;
      }
    });
    return status;
  }

  static Future<bool> signUp(String emailAddress, String password) async {
    bool success = false;
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      success = true;
      try {
        credential.user?.linkWithCredential(emailAddress as AuthCredential);
      } catch (e) {
        //add to app log
      }
      Get.snackbar("Sign in", "Welcome to Peepal farm family");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar("Sign in Error", "Use Strong Passowrd");
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar("Sign in Error", "Email already in use");
      }
    } catch (e) {
      Get.snackbar("Sign in Error", e.toString());
    }
    return success;
  }

  void login(String emailAddress, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      Get.snackbar("Success", "Welcome to Peepal Farm Family");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar("Error in login", "User not fount");
      } else if (e.code == 'wrong-password') {
        Get.snackbar("Error in login", "Wrong password");
      }
    }
  }
}
