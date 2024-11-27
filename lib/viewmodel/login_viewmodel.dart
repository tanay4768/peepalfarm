import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:peepalfram/model/user_model.dart';
import 'package:peepalfram/services/auth_service.dart';
import 'package:peepalfram/services/database_service.dart';
import 'package:peepalfram/utils/globals.dart';

class LoginViewmodel {
  static void login(String email, String password) async {
    if (await AuthService.login(email, password)) {
      final box = GetStorage();
      // User user = await DatabaseService.get(email);
      // String userJson = jsonEncode(user.toJson());
      Globals.showCustomSnackbar("Welcome", "Nice to See you again");
      // box.write('user', userJson);
    }
  }
}
