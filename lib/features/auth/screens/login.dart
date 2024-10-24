import 'package:brezie/features/auth/controller/login_controller.dart';
import 'package:brezie/features/auth/screens/forget_pin.dart';
import 'package:brezie/features/auth/screens/signup.dart';
import 'package:brezie/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    controller.createFormKey();

    return Form(
      key: controller.loginFormKey,
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 208, 207, 247), // Purplish color (top)
                Colors.white, // White color (bottom)
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 32.0, vertical: 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50), // Spacer for better top alignment

                  // Brezie Logo
                  Text(
                    'brezie',
                    style: TextStyle(
                      fontSize: 32,
                      color: Color(0xFF5341CB),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),

                  // Sign-in Header
                  Text(
                    'Sign in to Brezie',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),

                  // Welcome Text
                  Text(
                    'Welcome back! Sign in to get started',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF686E93),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Email Field
                  Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8),

                  TextFormField(
                    controller: controller.email,
                    validator: (value) => Validator.validateEmail(value),
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),

                  // PIN Section
                  Text(
                    'PIN',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8),

                  Pinput(
                    controller: controller.pin,
                    length: 4,
                    onCompleted: (pin) => print(pin),
                    defaultPinTheme: PinTheme(
                      width: 56,
                      height: 56,
                      textStyle: TextStyle(fontSize: 20, color: Colors.black),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey),
                      ),
                    ),
                  ),

                  SizedBox(height: 8),

                  // Forgot PIN
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () => Get.to(() => ForgetPinPage()),
                      child: Text('Forgot PIN?'),
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        textStyle: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),

                  // Sign-in Button
                  Container(
                    decoration: BoxDecoration(
                      color: Colors
                          .grey[200], // Match the fill color of the text field
                      borderRadius:
                          BorderRadius.circular(8), // Match the border radius
                    ),
                    child: ElevatedButton(
                      onPressed: () => controller.login(),
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 60),
                        backgroundColor: Color(0xFF5341CB),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white, // Text color
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),

                  // Sign-up Section
                  Center(
                    child: TextButton(
                      onPressed: () => Get.to(() => SignupPage()),
                      child: Text('Don’t have an account? Sign up now'),
                      style: TextButton.styleFrom(
                        textStyle: TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
