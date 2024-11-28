import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peepalfram/controllers/signin_controller.dart';
import 'package:peepalfram/services/validation.dart';
import 'package:peepalfram/utils/ui/sizeconstraints/display_config.dart';
import 'package:peepalfram/utils/ui/sizeconstraints/sizeconfig.dart';
import 'package:peepalfram/widgets/custom_textfield.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final controller = Get.put(SigninController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(SizeConfig.twenty),
            height: DisplayConfig.eight * 100.h,
            width: DisplayConfig.threeSixty.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: theme.brightness == Brightness.dark
                    ? const AssetImage("assets/images/bgdark.png")
                    : const AssetImage("assets/images/bglight.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: DisplayConfig.eight * 10.h),
                Text(
                  "Sign Up",
                  style: theme.textTheme.titleLarge,
                ),
                SizedBox(height: DisplayConfig.eight * 10.h),
                Card(
                  color: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                      color: theme.cardTheme.color,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Obx(
                            () => Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  CustomTextField(
                                    hintText: 'Full Name',
                                    errorText: controller.fullNameError.value,
                                    icon: Icons.person_pin_rounded,
                                    onChanged: (value) {
                                      controller.fullname = value;
                                      controller.fullNameError.value =
                                          value.isEmpty
                                              ? 'Please enter your full name'
                                              : "";
                                      controller
                                          .allFilled(); // Check if all fields are filled
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        controller.fullNameError.value =
                                            'Please enter your full name';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(height: DisplayConfig.ten.h),
                                  CustomTextField(
                                    hintText: 'Username',
                                    icon: Icons.person,
                                    errorText: controller.usernameError.value,
                                    onChanged: (value) {
                                      controller.username = value;
                                      controller.usernameError.value =
                                          value.isEmpty
                                              ? "Field can't be empty"
                                              : "";
                                      controller.allFilled();
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        controller.usernameError.value =
                                            "Field can't be empty";
                                        return null; // Prevents validation error
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(height: DisplayConfig.ten.h),
                                  CustomTextField(
                                    hintText: 'Email',
                                    icon: Icons.email,
                                    errorText: controller.emailError.value,
                                    onChanged: (value) {
                                      controller.email = value;
                                      controller.emailError.value =
                                          value.isEmpty
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
                                  SizedBox(height: DisplayConfig.ten.h),
                                  CustomTextField(
                                    hintText: 'Confirm Password',
                                    icon: Icons.lock,
                                    errorText:
                                        controller.cnfpasswordError.value,
                                    obscureText:
                                        !controller.showConfirmPassword.value,
                                    onChanged: (value) {
                                      controller.confirm = value;
                                      controller.cnfpasswordError.value =
                                          value.isEmpty
                                              ? 'Please confirm your password'
                                              : "";
                                      controller.allFilled();
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        controller.cnfpasswordError.value =
                                            'Please confirm your password';
                                      }
                                      if (controller.password !=
                                          controller.confirm) {
                                        controller.cnfpasswordError.value =
                                            'Passwords do not match';
                                        return null;
                                      }
                                      return null;
                                    },
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                          controller.showConfirmPassword.value
                                              ? Icons.visibility
                                              : Icons.visibility_off),
                                      onPressed: controller
                                          .toggleConfirmPasswordVisibility,
                                    ),
                                  ),
                                  SizedBox(height: DisplayConfig.twenty),
                                  ElevatedButton(
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        controller.signup();
                                      }
                                    },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: controller.signInbtn.value
                                        ? theme.hintColor
                                        : theme.hintColor.withOpacity(0.5),
                                  ),
                                    child: const Text('Sign Up'),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: DisplayConfig.twenty.sp,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Already have an account?'),
                              TextButton(
                                onPressed: () {
                                  Get.offNamed("/login");
                                },
                                child: Text(
                                  'Login',
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
