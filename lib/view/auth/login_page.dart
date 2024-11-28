import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peepalfram/controllers/login_controller.dart';
import 'package:peepalfram/services/validation.dart';
import 'package:peepalfram/utils/globals.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:peepalfram/utils/ui/sizeconstraints/display_config.dart';
import 'package:peepalfram/utils/ui/sizeconstraints/sizeconfig.dart';
import 'package:peepalfram/widgets/custom_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Container(
          padding: EdgeInsets.all(DisplayConfig.twenty),
          height: DisplayConfig.eight * 100.h,
          width: DisplayConfig.threeSixty.w,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: theme.brightness == Brightness.dark
                      ? const AssetImage("assets/images/bgdark.png")
                      : const AssetImage("assets/images/bglight.png"),
                  fit: BoxFit.cover)),
          child: Column(
            children: [
              SizedBox(
                height: DisplayConfig.eight * 20.h,
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
                        SizedBox(height: DisplayConfig.twenty.h),
                        Obx(
                          () => Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                SizedBox(height: DisplayConfig.ten.h),
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
                                SizedBox(height: DisplayConfig.ten.h),
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
                                SizedBox(height: DisplayConfig.twenty.h),
                                ElevatedButton(
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      controller.login();
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: controller.signInbtn.value
                                        ? theme.hintColor
                                        : theme.hintColor.withOpacity(0.5),
                                  ),
                                  child: const Text('Login'),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: DisplayConfig.ten.h),
                        TextButton(
                          style: const ButtonStyle(
                              alignment: Alignment.centerRight),
                          onPressed: () {
                            Globals.showResetDialog();
                          },
                          child: const Text('Forgot Password?'),
                        ),
                        SizedBox(height: DisplayConfig.twenty.h),
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
