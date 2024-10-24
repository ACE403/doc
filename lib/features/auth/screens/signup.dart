import 'package:brezie/features/auth/controller/signup_controller.dart';
import 'package:brezie/features/auth/screens/forget_pin.dart';
import 'package:brezie/features/auth/screens/login.dart';
import 'package:brezie/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';
import 'package:pinput/pinput.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    controller.createFormKey();
    return Form(
      key: controller.signupFormKey,
      child: Scaffold(
        backgroundColor: Colors.white,
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
                  SizedBox(height: 10), // Spacer for better top alignment

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
                    'Sign up to Brezie today',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),

                  // Welcome Text
                  Text(
                    'Enter your details to get started',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF686E93),
                    ),
                  ),
                  SizedBox(height: 20),
                  //Full NAme
                  Text(
                    'Full Name',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8),

                  TextFormField(
                    controller: controller.fullname,
                    validator: (value) =>
                        Validator.validateEmptyText('Name', value),
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
                  //Phone number
                  Text(
                    'Phone number',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8),

                  TextFormField(
                    controller: controller.phone,
                    validator: (value) => Validator.validatePhoneNumber(value),
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      icon: SizedBox(
                        width: 40,
                        child: Row(
                          children: [
                            SizedBox(width: 10, child: Icon(Icons.flag)),
                            SizedBox(
                              width: 5,
                            ),
                            SizedBox(
                              width: 10,
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.arrow_drop_down)),
                            )
                          ],
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),

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
                  SizedBox(height: 24),

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
                    length: 4,
                    onCompleted: (pin) => print(pin),
                    controller: controller.pin,
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
                  ElevatedButton(
                    onPressed: () => controller.signup(),
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
                        'Continue',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white, // Text color
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),

                  // Sign-up Section
                  Center(
                    child: TextButton(
                      onPressed: () => Get.to(() => LoginPage()),
                      child: Text('Already have a account?'),
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
