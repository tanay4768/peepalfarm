import 'package:get/get.dart';
import 'package:peepalfram/viewmodel/signup_viewmodel.dart';

class SigninController extends GetxController {
  RxString emailError = "".obs;
  RxString fullNameError = "".obs;
  RxString usernameError = "".obs;
  RxString passwordError = "".obs;
  RxString cnfpasswordError = "".obs;
  RxBool show1 = false.obs;
  RxBool show2 = false.obs;
  RxBool signInbtn = false.obs;
  RxBool isLoading = false.obs;

  String? email;
  String? password;
  String? confirm;
  String? fullname;
  String? usename;

  void allFilled() {
    if (email != null &&
        password != null &&
        confirm != null &&
        fullname != null &&
        usename != null) {
      if (email!.isNotEmpty &&
          usename!.isNotEmpty &&
          fullname!.isNotEmpty &&
          password!.isNotEmpty &&
          confirm!.isNotEmpty) signInbtn.value = true;
    }
  }

  void signup() {
    Auth.createAccount(email!, password!, confirm!, fullname!, usename!);
  }
}
