import 'package:brezie/data/repository/authentication/authentication_repository.dart';
import 'package:brezie/data/repository/forget_pin_repository.dart';
import 'package:brezie/features/auth/screens/login.dart';
import 'package:brezie/utils/constants/image_strings.dart';
import 'package:brezie/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class ForgetPinController extends GetxController {
  static ForgetPinController get instance => Get.find();

  final email = TextEditingController();
  final GlobalKey<FormState> forgetPinFormKey = GlobalKey<FormState>();

  void sendPasswordResetEmail() async {
    if (forgetPinFormKey.currentState!.validate()) {
      try {
        // Show a loading indicator
        showDialog(
          context: Get.context!,
          barrierDismissible: false,
          builder: (context) => Center(child: CircularProgressIndicator()),
        );

        // await ForgetPinRepository.instance.sendPasswordReset(email.text.trim());

        // Dismiss the loading indicator
        Get.back();

        // Show success message
        Get.snackbar(
          'Success',
          'Password reset link sent to ${email.text}.',
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
        );

        // Optionally, navigate back to login
        Get.to(() => LoginPage());
      }
      //  on FirebaseAuthException catch (e) {
      //   Get.back(); // Dismiss the loading indicator

      //   // Show error message
      //   Get.snackbar(
      //     'Error',
      //     e.message ??
      //         'An error occurred while sending the password reset email.',
      //     snackPosition: SnackPosition.BOTTOM,
      //     duration: Duration(seconds: 3),
      //   );
      // }
      catch (e) {
        Get.back(); // Dismiss the loading indicator
        Get.snackbar(
          'Error',
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
        );
      }
    }
  }
}
