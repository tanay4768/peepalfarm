import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peepalfram/controllers/login_controller.dart';
import 'package:peepalfram/services/validation.dart';
import 'package:peepalfram/utils/ui/custom_colors.dart';
import 'package:peepalfram/utils/ui/sizeconfig.dart';
import 'package:peepalfram/widgets/custom_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final controller = Get.put(LoginController());

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
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: theme.brightness == Brightness.dark
                      ? const AssetImage("assets/images/bgdark.png")
                      : const AssetImage("assets/images/bglight.png"),
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
                        Obx(
                          () => Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                SizedBox(height: SizeConfig.ten),
                                CustomTextField(
                                  hintText: 'Email',
                                  icon: Icons.email,
                                  errorText: controller.emailError.value,
                                  onChanged: (value) {
                                    controller.email = value;
                                    controller.emailError.value = value.isEmpty
                                        ? "Email can't be empty"
                                        : "";
                                    controller.allFilled();
                                  },
                                  validator: (value) {
                                    if (!Validator.validateEmail(value!)) {
                                      controller.emailError.value =
                                          'Please enter a valid email address';
                                      return null; // Prevents validation error
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: SizeConfig.ten),
                                CustomTextField(
                                  hintText: 'Password',
                                  icon: Icons.lock,
                                  errorText: controller.passwordError.value,
                                  obscureText: !controller.showPassword.value,
                                  onChanged: (value) {
                                    controller.password = value;
                                    controller.passwordError.value =
                                        value.isEmpty
                                            ? 'Please enter a password'
                                            : "";
                                    controller.allFilled();
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      controller.passwordError.value =
                                          'Please enter a password';
                                      return null; // Prevents validation error
                                    }
                                    return null;
                                  },
                                  suffixIcon: IconButton(
                                    icon: Icon(controller.showPassword.value
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                    onPressed:
                                        controller.togglePasswordVisibility,
                                  ),
                                ),
                                SizedBox(height: SizeConfig.twenty),
                                ElevatedButton(
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      controller.login();
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: controller.signInbtn.value
                                        ? CustomColors.primary
                                        : CustomColors.primary.withOpacity(0.5),
                                  ),
                                  child: const Text('Login'),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: SizeConfig.ten),
                        TextButton(
                          onPressed: () {},
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
