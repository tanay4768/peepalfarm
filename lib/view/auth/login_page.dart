import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peepalfram/utils/ui/sizeconfig.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Container(
          padding: EdgeInsets.all(SizeConfig.twenty),
          height: SizeConfig.eight * 100,
          width: SizeConfig.threeSixty,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: ThemeMode.system == Brightness.dark
                      ? AssetImage(
                          "assets/images/bgdark.png",
                        )
                      : AssetImage(
                          "assets/images/bglight.png",
                        ),
                  fit: BoxFit.cover)),
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.eight * 20,
              ),
              Card(
                color: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                    color: theme.cardTheme.color, // Adjust opacity as needed
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text('Login', style: theme.textTheme.headlineLarge),
                        SizedBox(height: SizeConfig.twenty),
                        TextField(
                          controller: _emailcontroller,
                          decoration: const InputDecoration(
                            hintText: 'Email',
                            prefixIcon: Icon(Icons.email),
                          ),
                        ),
                        SizedBox(height: SizeConfig.twenty),
                        TextField(
                          controller: _passwordcontroller,
                          decoration: const InputDecoration(
                            hintText: 'Password',
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: Icon(Icons.visibility),
                          ),
                          obscureText: true,
                        ),
                        SizedBox(height: SizeConfig.twenty),
                        ElevatedButton(
                          onPressed: () {
                            // Handle login button tap
                          },
                          child: const Text('Login'),
                        ),
                        SizedBox(height: SizeConfig.ten),
                        TextButton(
                          onPressed: () {
                            
                          },
                          child: const Text('Forgot Password?'),
                        ),
                        SizedBox(height: SizeConfig.twenty),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Don\'t have an account?'),
                            TextButton(
                              onPressed: () {
                                Get.offNamed("/signup");
                              },
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                    color: theme.scaffoldBackgroundColor,
                                    fontSize: SizeConfig.sixteen),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
