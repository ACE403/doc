// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class CloudHelperFunctions {
//   static Widget? checkSingleRecordState<T>(AsyncSnapshot<T> snapshot) {
//     if (snapshot.connectionState == ConnectionState.waiting) {
//       return const Center(child: CircularProgressIndicator());
//     }

//     if (!snapshot.hasData || snapshot.data == null) {
//       return const Center(child: Text("No Data Found!"));
//     }

//     if (snapshot.hasError) {
//       return const Center(child: Text("Something went wrong."));
//     }

//     return null; // In case there's no error and data is present, return null for further processing
//   }

//   static Widget? checkMultiRecordState<T>({
//     required AsyncSnapshot<List<T>> snapshot,
//     Widget? loader,
//     Widget? error,
//     Widget? nothingFound,
//   }) {
//     if (snapshot.connectionState == ConnectionState.waiting) {
//       if (loader != null) return loader;
//       return const Center(child: CircularProgressIndicator());
//     }

//     if (!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty) {
//       if (nothingFound != null) return nothingFound;
//       print(snapshot);
//       return const Center(child: Text(''));
//     }

//     if (snapshot.hasError) {
//       if (error != null) return error;
//       print(snapshot);
//       return const Center(child: Text('Something went wrong.'));
//     }

//     return null; // Return null for further processing if there's data
//   }

//   static Future<String> getURLFromFilePathAndName(String path) async {
//     try {
//       if (path.isEmpty) return '';
//       final ref = FirebaseStorage.instance.ref().child(path);
//       final url = await ref.getDownloadURL();
//       return url;
//     } on FirebaseException catch (e) {
//       throw e.message!;
//     } on PlatformException catch (e) {
//       throw e.message!;
//     } catch (e) {
//       throw 'Something went wrong.';
//     }
//   }
// }
