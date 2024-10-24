// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ForgetPinRepository extends GetxController {
  static ForgetPinRepository get instance => Get.find();
  // final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Future<void> sendPasswordReset(String email) async {
  //   try {
  //     await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  //   } on FirebaseException catch (e) {
  //     throw e; // Propagate the original exception
  //   } on FormatException catch (_) {
  //     throw const FormatException('Invalid email format.');
  //   } on PlatformException catch (e) {
  //     throw PlatformException(code: e.code, message: e.message);
  //   } catch (e) {
  //     throw Exception('Something went wrong. Please try again.');
  //   }
  // }
}
