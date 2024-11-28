import 'package:get/get.dart';
import 'package:peepalfram/viewmodel/login_viewmodel.dart';

class LoginController extends GetxController {
  RxString emailError = "".obs;
  RxString passwordError = "".obs;
  RxBool signInbtn = false.obs;
  String? email;
  String? password;
  RxBool showPassword = false.obs;
  void allFilled() {
    if (email != null && password!=null) {
  signInbtn.value = email.toString().isNotEmpty == true &&
      password.toString().isNotEmpty == true;
}
  }
    void togglePasswordVisibility() {
    showPassword.value = !showPassword.value;
  }
   void login() {
    LoginViewmodel.login(email.toString(), password.toString());
  }
}
