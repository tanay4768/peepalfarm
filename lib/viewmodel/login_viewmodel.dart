import 'dart:convert';

import 'package:get/get.dart';
      import 'package:get_storage/get_storage.dart';
import 'package:peepalfram/model/user_model.dart';

class LoginViewmodel {
  void login(String email, String password) {
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("Login error", "Fill the fields");
    }
    else{
final box = GetStorage();
User user = User(email: "example@email.com", fullName: "John Doe");
String userJson = jsonEncode(user.toJson()); // Convert User to JSON
// Store the JSON string in GetStorage
box.write('user', userJson);
    }
  }
}
