import 'package:peepalfram/services/auth_service.dart';
import 'package:peepalfram/services/database_service.dart';

class Auth {
  static void createAccount(String email, String password, String confirm,
      String fullname, String username) async {
    bool success = await AuthService.signUp(email, password);
    if (success) {
      DatabaseService.updateDatabase(email, fullname, username);
    }
  }
}
