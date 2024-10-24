import 'package:brezie/features/auth/controller/otp_verify_controller.dart';
import 'package:brezie/features/auth/screens/login.dart';
import 'package:brezie/features/dashboard/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
// import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class OtpVerify extends StatelessWidget {
  final String? phoneNumber; // Changed from email to phoneNumber
  const OtpVerify({super.key, required this.phoneNumber, String? email});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OtpVerifyController(phoneNumber: phoneNumber));

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              Center(
                child: Text(
                  'brezie',
                  style: TextStyle(
                    fontSize: 32,
                    color: Color(0xFF5341CB),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  'Log in to your account',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Center(
                child: Text(
                  'We have sent an OTP to your phone. Please check your SMS to verify your account.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF686E93),
                  ),
                ),
              ),
              SizedBox(height: 48),
              Text(
                'PIN',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 16),
              Pinput(
                controller: controller.otp,
                length: 6,
                onCompleted: (pin) {
                  Get.to(LoginPage());
                },
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
              SizedBox(height: 16),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    // controller.resendOtp();
                  },
                  child: Text('Didn\'t receive the code? Resend code'),
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    textStyle: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
