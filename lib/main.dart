import 'package:brezie/app.dart';
import 'package:brezie/firebase_options.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

// import 'package:get_storage/get_storage.dart';
import 'data/repository/authentication/authentication_repository.dart';

// Import the firebase_app_check plugin
// import 'package:firebase_app_check/firebase_app_check.dart';

Future<void> main() async {
  //Add widgtes Binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  //Init Local Storage
  // await GetStorage.init();
  //Init Payment Methods
  //Await Native Splash
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  //Initialize Firebase
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
  //     .then((FirebaseApp value) => Get.put(AuthenticationRepository()));

// await Firebase.initializeApp();

  runApp(const App());
}
