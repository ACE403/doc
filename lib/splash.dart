import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:brezie/features/auth/screens/login.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    // Delay for 3 seconds before navigating to the Login page
    Future.delayed(Duration(seconds: 3), () {
      Get.off(() => LoginPage()); // Navigate to LoginPage
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          'brezie',
          style: TextStyle(
            fontSize: 48,
            color: Color(0xFF5341CB),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
