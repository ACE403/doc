import 'package:brezie/data/repository/dashboard_repository.dart';
import 'package:brezie/features/dashboard/controller/profile_dropdown.dart';

import 'package:brezie/features/dashboard/model/dashboard_model.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  var documents = <Document>[].obs;
  // final _auth = FirebaseAuth.instance;
  // final dashboardRepo = DashboardRepository.instance;

  // @override
  // void onInit() {
  //   Get.put(UserDropdownController());
  //   // Listen to document changes from Firestore and update the documents list
  //   dashboardRepo.getDocumentsStream().listen((docs) {
  //     documents.value = docs;
  //   });
  //   super.onInit();
  // }

  Future<void> addDocument(Document document) async {
    // await dashboardRepo.saveDocument(document);
    documents.add(document);
  }

  Future<void> deleteDocument(int index) async {
    // await dashboardRepo.removeDocument(id);
    documents.removeAt(index); // Remove document from the list
  }
}
