import 'package:brezie/data/repository/authentication/authentication_repository.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:brezie/utils/popups/loaders.dart';

class OtpVerifyController extends GetxController {
  final String? email;
  TextEditingController otp = TextEditingController();
  OtpVerifyController({this.email, String? phoneNumber});
}
