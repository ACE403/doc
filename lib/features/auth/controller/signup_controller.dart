import 'package:brezie/data/repository/authentication/authentication_repository.dart';
import 'package:brezie/data/repository/user_repository.dart';
import 'package:brezie/features/auth/model/user_model.dart';
import 'package:brezie/features/auth/screens/otp_verify.dart';
import 'package:brezie/features/dashboard/controller/profile_dropdown.dart';
import 'package:brezie/utils/helpers/network_manager.dart';
import 'package:brezie/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();
  final email = TextEditingController();
  final fullname = TextEditingController();
  final pin = TextEditingController();
  final phone = TextEditingController();

  late GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  void createFormKey() {
    signupFormKey = GlobalKey<FormState>();
  }

  //Signup
  void signup() async {
    try {
      Loaders.loadingSnackBar(title: 'Please wait');
      // Check Internet Connectivity
      // final isConnected = await NetworkManager.instance.isConnected();

      // if (!isConnected) {
      //   Loaders.errorSnackBar(title: 'Error');
      //   return;
      // }

      // Form Validation
      if (!signupFormKey.currentState!.validate()) {
        return;
      }

      // Register user
      // final UserCredential = await AuthenticationRepository.instance
      //     .registerWithEmailAndPassword(
      //         email.text.trim(), pin.text.trim() + "00");

      // Save Authenticated user data
      // final newUser = UserModel(
      //   id: UserCredential.user!.uid,
      //   fullName: fullname.text.trim(),
      //   pin: pin.text.trim(),
      //   email: email.text.trim(),
      //   phoneNumber: phone.text.trim(),
      // );

      // final userRepository = Get.put(UserRepository());
      // await userRepository.saveUserRecord(newUser);

      // Add the new user to the dropdown list
      // final dropdownController = Get.find<UserDropdownController>();
      // dropdownController.addUser(newUser);

      // Show success message
      Loaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your account has been created! Verify email to continue');

      Get.to(OtpVerify(phoneNumber: phone.text.trim()));
    } catch (e) {
      Loaders.errorSnackBar(title: 'oh snap!', message: e.toString());
    }
  }
}
