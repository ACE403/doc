import 'package:brezie/features/auth/model/user_model.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  // final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Function to save user data to Firestore.
  // Future<void> saveUserRecord(UserModel user) async {
  //   try {
  //     await _db.collection("Users").doc(user.id).set(user.toJson());
  //   } on FirebaseException catch (e) {
  //     throw FirebaseException(
  //         plugin: e.plugin, message: e.message, code: e.code);
  //   } on FormatException catch (_) {
  //     throw const FormatException();
  //   } on PlatformException catch (e) {
  //     throw PlatformException(code: e.code, message: e.message);
  //   } catch (e) {
  //     throw 'Something went wrong. Please try again';
  //   }
  // }

  /// Function to remove user account from Firestore.
  // Future<void> removeUserAccount(String userId) async {
  //   try {
  //     await _db.collection("Users").doc(userId).delete();
  //   } on FirebaseException catch (e) {
  //     throw FirebaseException(
  //         plugin: e.plugin, message: e.message, code: e.code);
  //   } on FormatException catch (_) {
  //     throw const FormatException();
  //   } on PlatformException catch (e) {
  //     throw PlatformException(code: e.code, message: e.message);
  //   } catch (e) {
  //     throw 'Failed to delete user account. Please try again';
  //   }
  // }
}
