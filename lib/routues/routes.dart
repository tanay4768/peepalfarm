import 'package:get/get.dart';
import 'package:peepalfram/view/auth/login_page.dart';
import 'package:peepalfram/view/auth/signup_page.dart';
import 'package:peepalfram/view/get_started.dart';

class Routes {
  static List<GetPage> getroots() {
    final routes = [
      GetPage(name: '/', page: () => const GetStarted()),
      GetPage(name: '/login', page: () => const LoginPage()),
      GetPage(name: '/signup', page: () => const SignupPage()),
    ];
    return routes;
  }
}
