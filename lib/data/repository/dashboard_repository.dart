// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:brezie/features/dashboard/model/dashboard_model.dart';

class DashboardRepository extends GetxController {
  static DashboardRepository get instance => Get.find();
  // final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Save document to Firestore.
  // Future<void> saveDocument(Document document) async {
  //   try {
  //     await _db.collection("Documents").add(document.toFirestore());
  //   } on FirebaseException catch (e) {
  //     throw FirebaseException(
  //       plugin: e.plugin,
  //       message: e.message,
  //       code: e.code,
  //     );
  //   } catch (e) {
  //     throw 'Something went wrong. Please try again';
  //   }
  // }

  /// Remove document from Firestore.
  // Future<void> removeDocument(String documentId) async {
  //   try {
  //     await _db.collection("Documents").doc(documentId).delete();
  //   } on FirebaseException catch (e) {
  //     throw FirebaseException(
  //       plugin: e.plugin,
  //       message: e.message,
  //       code: e.code,
  //     );
  //   } catch (e) {
  //     throw 'Failed to delete document. Please try again';
  //   }
  // }

  // /// Fetch all documents from Firestore.
  // Stream<List<Document>> getDocumentsStream() {
  //   return _db.collection("Documents").snapshots().map((snapshot) {
  //     return snapshot.docs.map((doc) => Document.fromSnapshot(doc)).toList();
  //   });
  // }
}
