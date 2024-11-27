import 'package:get/get.dart';
import 'package:peepalfram/utils/globals.dart';
import 'package:peepalfram/viewmodel/signup_viewmodel.dart';

class SigninController extends GetxController {
  RxString emailError = "".obs;
  RxString fullNameError = "".obs;
  RxString usernameError = "".obs;
  RxString passwordError = "".obs;
  RxString cnfpasswordError = "".obs;
  RxBool showPassword = false.obs; // For password visibility
  RxBool showConfirmPassword = false.obs; // For confirm password visibility
  RxBool signInbtn = false.obs; // To enable/disable the Sign Up button
  RxBool isLoading = false.obs; // To show loading indicator

  String? email;
  String? password;
  String? confirm;
  String? fullname;
  String? username;

 
  void allFilled() {
    signInbtn.value = email.toString().isNotEmpty == true &&
        password.toString().isNotEmpty == true &&
        confirm.toString().isNotEmpty == true &&
        fullname.toString().isNotEmpty == true &&
        username.toString().isNotEmpty == true;
  }


  void togglePasswordVisibility() {
    showPassword.value = !showPassword.value;
  }


  void toggleConfirmPasswordVisibility() {
    showConfirmPassword.value = !showConfirmPassword.value;
  }


  void signup() {
    if (signInbtn.value) {
      isLoading.value = true;
      SignupViewmodel.createAccount(
              email!, password!, confirm!, fullname!, username!)
          .then((result) {
        if (result) {
          Globals.showCustomSnackbar(
              "Sign In successful", "Welcom to Peepal Farm");
        }
      }).whenComplete(() {
        isLoading.value = false; 
      });
    }
  }
}
