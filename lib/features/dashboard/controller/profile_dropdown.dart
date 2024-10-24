import 'package:brezie/data/repository/user_repository.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth
import 'package:brezie/data/repository/authentication/authentication_repository.dart';
import 'package:brezie/features/auth/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserDropdownController extends GetxController {
  var isDropdownOpen = false.obs;
  var currentUser = Rx<UserModel?>(null); // Observable to hold the current user
  var users = <UserModel>[].obs; // Observable list of users

  @override
  void onInit() {
    users.add(UserModel(
        id: "",
        fullName: "User",
        email: "email",
        phoneNumber: "phoneNumber",
        pin: "pin"));
    super.onInit();
    // _initializeCurrentUser();
    // fetchAllUsers();
  }

  // // Initialize the current user from Firebase
  // void _initializeCurrentUser() {
  //   final user =
  //       FirebaseAuth.instance.currentUser; // Get the current Firebase user
  //   if (user != null) {
  //     // Convert Firebase user to your UserModel
  //     currentUser.value = UserModel(
  //       id: user.uid, // Assuming you have an ID field in your UserModel
  //       email: user.email ?? "",
  //       fullName: user.displayName ?? "",
  //       phoneNumber: user.phoneNumber ?? "",
  //       pin: user.tenantId ?? "",
  //     );
  //   }
  // }

  // // Fetch all users from Firestore
  // void fetchAllUsers() async {
  //   try {
  //     QuerySnapshot snapshot =
  //         await FirebaseFirestore.instance.collection('Users').get();
  //     users.clear(); // Clear the existing list
  //     for (var doc in snapshot.docs) {
  //       // Convert Firestore documents to UserModel instances
  //       users.add(UserModel(
  //         id: doc.id,
  //         email: doc['Email'] ?? '',
  //         fullName: doc['FullName'] ?? '',
  //         phoneNumber: doc['PhoneNumber'] ?? '',
  //         pin: doc['Pin'] ?? '',
  //       ));
  //     }
  //   } catch (e) {
  //     print("Error fetching users: $e");
  //     // Handle any errors that occur during the fetch
  //   }
  // }

  // // Fetch all users from Firestore
  // Future<UserModel?> fetchOneUsers() async {
  //   try {
  //     QuerySnapshot snapshot =
  //         await FirebaseFirestore.instance.collection('Users').limit(1).get();

  //     if (snapshot.docs.isNotEmpty) {
  //       // Return the first user from the fetched documents
  //       var doc = snapshot.docs.first;
  //       return UserModel(
  //         id: doc.id,
  //         email: doc['Email'] ?? '',
  //         fullName: doc['FullName'] ?? '',
  //         phoneNumber: doc['PhoneNumber'] ?? '',
  //         pin: doc['Pin'] ?? '',
  //       );
  //     }
  //     return null; // No users found
  //   } catch (e) {
  //     print("Error fetching user: $e");
  //     return null; // Return null in case of an error
  //   }
  // }

  void toggleDropdown() {
    isDropdownOpen.value = !isDropdownOpen.value;
  }

  void switchUser(UserModel user) {
    currentUser.value = user; // Switch to the selected user
    // Here, you can also navigate to the respective dashboard for the user
  }

  void addUser(UserModel user) {
    users.add(user); // Add new user to the list
    currentUser.value = user; // Optionally switch to the new user immediately
  }

  // void signOut() {
  //   AuthenticationRepository.instance.logout();
  // }

  void deleteUser(UserModel user) async {
    final confirmation = await Get.dialog<bool>(
      AlertDialog(
        title: Text("Delete Account"),
        content: Text("Are you sure you want to delete this account?"),
        actions: [
          TextButton(
            onPressed: () => Get.back(result: false), // Cancel
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () => Get.back(result: true), // Confirm
            child: Text("Delete"),
          ),
        ],
      ),
    );

    if (confirmation == true) {
      // Remove the user from Firestore
      // AuthenticationRepository.instance.deleteAccount();
      // final userRepository = Get.put(UserRepository());
      // await userRepository.removeUserAccount(user.toString());

      // Remove user from the list
      users.remove(user);

      // Show success message
      Get.snackbar("Success", "User account deleted successfully");

      // Fetch one user to update the currentUser
      // UserModel? fetchedUser = await fetchOneUsers();

      // // Update the currentUser or set it to null if no user is found
      // if (fetchedUser != null) {
      //   currentUser.value = fetchedUser;
      // } else {
      //   currentUser.value = null; // No users left
      // }

      // // Refresh the user list and dropdown
      // fetchAllUsers(); // Re-fetch all users after deletion

      // Optionally, force a screen update to ensure the UI reflects changes
      Get.forceAppUpdate(); // Refresh the entire screen if needed
    }
  }
}
