import 'package:brezie/data/repository/authentication/authentication_repository.dart';
import 'package:brezie/features/dashboard/screens/dashboard.dart';
import 'package:brezie/utils/constants/image_strings.dart';
import 'package:brezie/utils/helpers/network_manager.dart';
import 'package:brezie/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final email = TextEditingController();
  final pin = TextEditingController();

  late GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  void createFormKey() {
    loginFormKey = GlobalKey<FormState>();
  }

  Future<void> login() async {
    try {
      //Check Interenet Connectivity
      Loaders.loadingSnackBar(title: "Please wait");
      // final isConnected = await NetworkManager.instance.isConnected();

      // if (!isConnected) {
      //   Loaders.errorSnackBar(
      //     title: 'Connection Error',
      //     message: 'No internet connection available.',
      //   );
      //   return;
      // }

      //Form Validation
      // if (!loginFormKey.currentState!.validate()) {
      //   return;
      // }

      // final userCredentials = await AuthenticationRepository.instance
      //     .loginWithEmailAndPassword(email.text.trim(), pin.text.trim() + "00");

      // AuthenticationRepository.instance.screenRedirect();
      Get.to(() => Dashboard());
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
