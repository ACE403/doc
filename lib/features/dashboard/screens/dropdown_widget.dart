import 'package:brezie/features/dashboard/controller/profile_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:brezie/data/repository/authentication/authentication_repository.dart';
import 'package:brezie/features/auth/screens/signup.dart';
import 'package:iconsax/iconsax.dart'; // Import the SignUp screen

class UserDropdown extends StatelessWidget {
  final UserDropdownController dropdownController =
      Get.put(UserDropdownController());

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            dropdownController.toggleDropdown();
            // Directly show the popup menu when the dropdown is tapped
            showMenu(
              context: context,
              position: RelativeRect.fromLTRB(
                  MediaQuery.of(context).size.width - 250,
                  60,
                  0,
                  0), // Adjust position to align on the right
              items: [
                PopupMenuItem(
                  // padding: EdgeInsets.all(10),
                  value: 1,
                  child: Column(
                    children: [
                      // Profile Info Section in Center
                      Center(
                        child: Column(
                          children: [
                            Icon(Icons.person, size: 50, color: Colors.grey),
                            SizedBox(height: 10),
                            Obx(
                              () => Text(
                                dropdownController
                                        .currentUser.value?.fullName ??
                                    'User Name', // Display current user's name
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                            ),
                            Obx(
                              () => Text(
                                dropdownController.currentUser.value?.email ??
                                    'user@example.com', // Display current user's email
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        endIndent: 50,
                        indent: 50,
                        color: Colors.grey[500],
                      ),
                      // Existing users from the dropdown

                      ...dropdownController.users.map((user) {
                        return GestureDetector(
                          onLongPress: () =>
                              dropdownController.deleteUser(user),
                          child: ListTile(
                            leading: Icon(
                              Icons.person,
                              color: Colors.grey,
                            ),
                            title: Text(
                              user.fullName,
                              style: TextStyle(color: Colors.black),
                            ), // Display each user's name
                            onTap: () {
                              dropdownController
                                  .switchUser(user); // Switch to selected user
                              Navigator.pop(
                                  context); // Close the popup when a user is selected
                            },
                          ),
                        );
                      }).toList(),
                      Divider(
                        endIndent: 50,
                        indent: 50,
                        color: Colors.grey[500],
                      ),
                      // Add another account section
                      ListTile(
                        leading: Icon(
                          Iconsax.profile_add,
                          color: Colors.black,
                        ),
                        title: Text(
                          'Add Another Account',
                          style: TextStyle(color: Colors.black),
                        ),
                        onTap: () {
                          Get.to(
                              () => SignupPage()); // Navigate to SignUp screen
                          Navigator.pop(
                              context); // Close the popup after navigation
                        },
                      ),
                      // Logout Section
                      ListTile(
                        leading: Icon(
                          Iconsax.logout,
                          color: Colors.black,
                        ),
                        title: Text('Logout',
                            style: TextStyle(color: Colors.black)),
                        onTap: () {
                          // dropdownController.signOut(); // Call signOut from the controller
                          Navigator.pop(
                              context); // Close the popup after logout
                        },
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
          child: Row(
            children: [
              Icon(Iconsax.profile_add, size: 25), // Profile icon
              SizedBox(width: 8),
              Obx(
                () => SizedBox(
                  width: 60,
                  child: Text(
                    dropdownController.currentUser.value?.fullName ??
                        'User Name',
                    overflow:
                        TextOverflow.ellipsis, // Display current user's name
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
              ),
              SizedBox(width: 8),
              Obx(() => Icon(
                    dropdownController.isDropdownOpen.value
                        ? Icons.arrow_drop_up
                        : Icons.arrow_drop_down,
                    size: 24,
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
