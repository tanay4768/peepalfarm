import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:peepalfram/utils/globals.dart';

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
      // try {
      //   credential.user?.linkWithCredential(emailAddress as AuthCredential);
      // } catch (e) {
      //   //add to app log
      // }
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

  static Future<bool> login(String emailAddress, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Globals.showCustomSnackbar("Error in login", "User not fount");
        
      } else if (e.code == 'wrong-password') {
         Globals.showCustomSnackbar("Error in login",  "Wrong password");
      }
      return false;
    }
  }
}
