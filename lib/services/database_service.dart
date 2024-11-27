import 'package:firebase_database/firebase_database.dart';
import 'package:peepalfram/model/user_model.dart';

class DatabaseService {
   static final _ref = FirebaseDatabase.instance;

  static void updateDatabase(String email,
      String fullname, String username) async {
    final dbref = _ref.ref("users/$email");
    await dbref.set({
      "fullname": fullname,
      "username": username,
    });
  }

  static Future<User> get(String email) async {
    final dbref = _ref.ref("users/$email");
    final event = await dbref.once(DatabaseEventType.value);
    final data = event.snapshot.value;
    if (data is Map) {
      return User.fromJson(data);
    }
    return User(email: "", fullName: "");
  }
}
