import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peepalfram/controllers/signin_controller.dart';
import 'package:peepalfram/services/validation.dart';
import 'package:peepalfram/utils/ui/custom_colors.dart';
import 'package:peepalfram/utils/ui/sizeconfig.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<SignupPage> {
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
                    color: theme.cardTheme.color,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Obx(() => Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              // Full Name field
                              TextFormField(
                                decoration: const InputDecoration(
                                  hintText: 'Full Name',
                                  prefixIcon: Icon(Icons.person),
                                ),
                                style: theme.textTheme.bodyMedium,
                                onChanged: (value) {
                                  controller.fullname = value;
                                  controller.allFilled();
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your full name';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: SizeConfig.ten,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Username',
                                  prefixIcon: const Icon(Icons.person),
                                  errorText: controller.usernameError.value,
                                ),
                                style: theme.textTheme.bodyMedium,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    controller.usernameError.value =
                                        "Field can't be empty";
                                  }
                                },
                                onChanged: (value) {
                                  controller.usename = value;
                                  if (value.isEmpty) {
                                    controller.usernameError.value =
                                        "Field can't be empty";
                                  }
                                },
                              ),
                              SizedBox(
                                height: SizeConfig.ten,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Email',
                                  prefixIcon: Icon(Icons.email),
                                  errorText: controller.emailError.value,
                                ),
                                style: theme.textTheme.bodyMedium,
                                onChanged: (value) {
                                  controller.email = value;
                                  if (value.isEmpty) {
                                    controller.emailError.value =
                                        'Please enter your email';
                                  }
                                },
                                validator: (value) {
                                  if (!Validator.validateEmail(
                                      value.toString())) {
                                    controller.emailError.value =
                                        'Please enter a valid email address';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: SizeConfig.ten,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  errorText: controller.passwordError.value,
                                  prefixIcon: const Icon(Icons.lock),
                                  prefixIconColor: theme
                                      .inputDecorationTheme.prefixIconColor,
                                  suffixIcon: const Icon(Icons.visibility),
                                  border: theme.inputDecorationTheme.border,
                                ),
                                style: theme.textTheme.bodyMedium,
                                obscureText: true,
                                onChanged: (value) {
                                  controller.password = value;
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    controller.passwordError.value =
                                        'Please enter a password';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: SizeConfig.ten,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    hintText: 'Confirm Password',
                                    prefixIcon: const Icon(Icons.lock),
                                    errorText:
                                        controller.cnfpasswordError.value,
                                    suffixIcon: const Icon(Icons.visibility)),
                                style: theme.textTheme.bodyMedium,
                                obscureText: true,
                                onChanged: (value) {
                                  controller.confirm = value;
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    controller.passwordError.value =
                                        'Please enter a password';
                                  }
                                },
                              ),
                              SizedBox(
                                height: SizeConfig.twenty,
                              ),
                             Obx(
  () => ElevatedButton(
    style: controller.signInbtn.value
        ? (theme.elevatedButtonTheme.style != null)
            ? theme.elevatedButtonTheme.style!.copyWith(
                backgroundColor: WidgetStateProperty.all<Color>(CustomColors.black.withOpacity(0.2)),
              )
            : null
        : null, // Maintain default style if signInbtn is false
    onPressed: () {
      if (_formKey.currentState!.validate()) {
        controller.signup();
      }
    },
    child: controller.isLoading.value
        ? CircularProgressIndicator()
        : Text('Sign Up'),
  ),
),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Already have an account?',
                                    style: theme.textTheme.bodySmall,
                                  ),
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
                        )),
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
