// import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'dart:io';

import 'package:brezie/data/repository/user_repository.dart';
import 'package:brezie/features/auth/screens/signup.dart';
import 'package:brezie/features/auth/screens/login.dart';

import 'package:brezie/features/auth/screens/otp_verify.dart';
import 'package:brezie/splash.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:brezie/features/dashboard/screens/dashboard.dart';
import '../../../utils/local_storage/storage_utility.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //Variable

  // final deviceStorage = GetStorage();
  // static final _auth = FirebaseAuth.instance;

//Getter

  // User? get authUser => _auth.currentUser!;
  // Called from main.dart
  @override
  void onReady() {
    // FlutterNativeSplash.remove();
    // screenRedirect();
  }

  // screenRedirect() async {
  // final user = _auth.currentUser;
  // if (user != null) {
  //   if (user.emailVerified) {
  //     // await LocalStorage.init(user.uid);
  //     Get.offAll(() => Dashboard());
  //   } else {
  //     Get.to(() => OtpVerify(phoneNumber: _auth.currentUser!.phoneNumber));
  // Get.offAll(() => LoginPage());
  // Get.offAll(() => Dashboard());
  // sendOTP(
  //   _auth.currentUser!.email,
  //   _auth.currentUser!.phoneNumber,
  // );

  // Get.offAll(() => OtpVerify(
  //       email: _auth.currentUser!.email,
  //       phonenumber: _auth.currentUser!.phoneNumber,
  //     ));
  //   }
  // } else {
  //   deviceStorage.writeIfNull('isfirsttime', true);
  //   deviceStorage.read('isfirsttime') != true
  //       ? Get.offAll(() => LoginPage())
  //       // : Get.offAll(() => OnboardingScreen());
  //       : Get.offAll(() => Splash());
  // }
  //   Get.offAll(() => Splash());
  // }

  // //Email authentication -signin
  // Future<UserCredential> loginWithEmailAndPassword(
  //     String email, String password) async {
  //   try {
  //     return await _auth.signInWithEmailAndPassword(
  //         email: email, password: password);
  //   } on FirebaseAuthException catch (e) {
  //     throw e.message ?? 'An error occurred during registration';
  //   } on FirebaseException catch (e) {
  //     throw e.message ?? 'A Firebase error occurred';
  //   } on FormatException {
  //     throw 'Invalid format detected';
  //   } on PlatformException catch (e) {
  //     throw e.message ?? 'A platform error occurred';
  //   } catch (e) {
  //     throw 'Something went wrong, please try again';
  //   }
  // }

  // //Email authentication - Register
  // Future<UserCredential> registerWithEmailAndPassword(
  //     String email, String password) async {
  //   try {
  //     return await _auth.createUserWithEmailAndPassword(
  //         email: email, password: password);
  //   } on FirebaseAuthException catch (e) {
  //     throw e.message ?? 'An error occurred during registration';
  //   } on FirebaseException catch (e) {
  //     throw e.message ?? 'A Firebase error occurred';
  //   } on FormatException {
  //     throw 'Invalid format detected';
  //   } on PlatformException catch (e) {
  //     throw e.message ?? 'A platform error occurred';
  //   } catch (e) {
  //     throw 'Something went wrong, please try again';
  //   }
  // }

  // // Sign Out
  // Future<void> logout() async {
  //   await _auth.signOut();
  //   Get.offAll(() => LoginPage());
  // }

// Send OTP for Phone Number Verification
// // Send OTP for Phone Number Verification
//   Future<void> sendOTP(String? email, String? phoneNumber) async {
//     try {
//       print("email = $email");

//       // Format the phone number to E.164
//       String formattedPhoneNumber = formatPhoneNumber(phoneNumber!);
//       print("phone = $formattedPhoneNumber");

//       await _auth.verifyPhoneNumber(
//         phoneNumber: formattedPhoneNumber,
//         verificationCompleted: (PhoneAuthCredential credential) async {
//           await _auth.signInWithCredential(credential);
//         },
//         verificationFailed: (FirebaseAuthException e) {
//           print('Verification failed: ${e.message}');
//         },
//         codeSent: (String verificationId, int? resendToken) {
//           // Store the verification ID for later use
//           print("email 2 = $email");
//           print("phone 2= $formattedPhoneNumber");
//           Get.offAll(() => OtpVerify(
//                 verificationId: verificationId,
//                 email: email,
//                 phonenumber: formattedPhoneNumber,
//               ));
//         },
//         codeAutoRetrievalTimeout: (String verificationId) {
//           print('Auto-retrieval timeout. Verification ID: $verificationId');
//         },
//       );
//     } catch (e) {
//       print('Error during phone verification: $e');
//     }
//   }

// // Verify OTP
//   Future<UserCredential> verifyOTP(
//       String verificationId, String otpCode) async {
//     try {
//       PhoneAuthCredential credential = PhoneAuthProvider.credential(
//         verificationId: verificationId,
//         smsCode: otpCode,
//       );
//       UserCredential userCredential =
//           await _auth.signInWithCredential(credential);
//       return userCredential;
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'invalid-verification-code') {
//         print('The verification code entered is invalid.');
//       } else {
//         print('Verification failed: ${e.message}');
//       }
//       rethrow;
//     } catch (e) {
//       print('Error during OTP verification: $e');
//       rethrow;
//     }
//   }

  String formatPhoneNumber(String phoneNumber) {
    if (phoneNumber.startsWith('0')) {
      phoneNumber = phoneNumber.substring(1); // Remove leading 0
    }
    return '+91$phoneNumber'; // For India; change based on your country
  }

  //verify email
  // Future<void> sendEmailVerification() async {
  //   try {
  //     await _auth.currentUser?.sendEmailVerification();
  //   } on FirebaseAuthException catch (e) {
  //     throw e.message ?? 'An error occurred during registration';
  //   } on FirebaseException catch (e) {
  //     throw e.message ?? 'A Firebase error occurred';
  //   } on FormatException {
  //     throw 'Invalid format detected';
  //   } on PlatformException catch (e) {
  //     throw e.message ?? 'A platform error occurred';
  //   } catch (e) {
  //     throw 'Something went wrong, please try again';
  //   }
  // }

//   //Email verification
//   //Reauthenticate
//   Future<void> reAuthenticateWithEmailAndPassword(
//       String email, String password) async {
//     try {
//       AuthCredential credential =
//           EmailAuthProvider.credential(email: email, password: password);

//       await _auth.currentUser!.reauthenticateWithCredential(credential);
//     } on FirebaseAuthException catch (e) {
//       throw e.message ?? 'An error occurred during registration';
//     } on FirebaseException catch (e) {
//       throw e.message ?? 'A Firebase error occurred';
//     } on FormatException {
//       throw 'Invalid format detected';
//     } on PlatformException catch (e) {
//       throw e.message ?? 'A platform error occurred';
//     } catch (e) {
//       throw 'Something went wrong, please try again';
//     }
//   }

//   //Email authentication - forget password
//   Future<void> sendPasswordResetEmail(String email) async {
//     try {
//       await _auth.sendPasswordResetEmail(email: email);
//     } on FirebaseAuthException catch (e) {
//       throw e.message ?? 'An error occurred during registration';
//     } on FirebaseException catch (e) {
//       throw e.message ?? 'A Firebase error occurred';
//     } on FormatException {
//       throw 'Invalid format detected';
//     } on PlatformException catch (e) {
//       throw e.message ?? 'A platform error occurred';
//     } catch (e) {
//       throw 'Something went wrong, please try again';
//     }
//   }

//   //Google Auth
//   Future<UserCredential?> signInGoogle() async {
//     try {
//       //trigger authentication
//       final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
// //Obtain auth details
//       final GoogleSignInAuthentication? googleAuth =
//           await userAccount?.authentication;
// //Create a new credential
//       final credentials = GoogleAuthProvider.credential(
//           accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
// //Once signin, return user credential
//       return await _auth.signInWithCredential(credentials);
//     } on FirebaseAuthException catch (e) {
//       throw e.message ?? 'An error occurred during registration';
//     } on FirebaseException catch (e) {
//       throw e.message ?? 'A Firebase error occurred';
//     } on FormatException {
//       throw 'Invalid format detected';
//     } on PlatformException catch (e) {
//       throw e.message ?? 'A platform error occurred';
//     } catch (e) {
//       if (kDebugMode) print('Something went wrong : $e');
//       return null;
//     }
//   }
//   //Facebook Auth

//   //Logout user
//   Future<void> logout() async {
//     try {
//       await GoogleSignIn().signOut();
//       await FirebaseAuth.instance.signOut();
//       Get.offAll(() => LoginPage());
//     } on FirebaseAuthException catch (e) {
//       throw e.message ?? 'An error occurred during registration';
//     } on FirebaseException catch (e) {
//       throw e.message ?? 'A Firebase error occurred';
//     } on FormatException {
//       throw 'Invalid format detected';
//     } on PlatformException catch (e) {
//       throw e.message ?? 'A platform error occurred';
//     } catch (e) {
//       throw 'Something went wrong, please try again';
//     }
//   }

  //Delete User
  // Future<void> deleteAccount() async {
  //   try {
  //     await UserRepository.instance.removeUserAccount(_auth.currentUser!.uid);
  //     await _auth.currentUser?.delete();
  //   } on FirebaseAuthException catch (e) {
  //     throw e.message ?? 'An error occurred during registration';
  //   } on FirebaseException catch (e) {
  //     throw e.message ?? 'A Firebase error occurred';
  //   } on FormatException {
  //     throw 'Invalid format detected';
  //   } on PlatformException catch (e) {
  //     throw e.message ?? 'A platform error occurred';
  //   } catch (e) {
  //     throw 'Something went wrong, please try again';
  //   }
  // }
}
