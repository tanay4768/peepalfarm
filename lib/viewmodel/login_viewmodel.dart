
import 'package:peepalfram/services/auth_service.dart';
import 'package:peepalfram/utils/globals.dart';

class LoginViewmodel {
  static void login(String email, String password) async {
    if (await AuthService.login(email, password)) {
      // User user = await DatabaseService.get(email);
      // String userJson = jsonEncode(user.toJson());
      Globals.showCustomSnackbar("Welcome", "Nice to See you again");
      // box.write('user', userJson);
    }
  }
}
