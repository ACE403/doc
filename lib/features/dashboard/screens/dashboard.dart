import 'package:brezie/data/repository/authentication/authentication_repository.dart';
import 'package:brezie/features/dashboard/controller/dashboard_controller.dart';
import 'package:brezie/features/dashboard/model/dashboard_model.dart';
import 'package:brezie/features/dashboard/screens/Drawer.dart';
import 'package:brezie/features/dashboard/screens/dropdown_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart'; // Updated import statement

class Dashboard extends StatelessWidget {
  final DashboardController controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 208, 207, 247),
        automaticallyImplyLeading: false,
        title: Text(
          'brezie',
          style: TextStyle(
            fontSize: 28, // Decreased font size
            color: Color(0xFF5341CB),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [UserDropdown()],
      ),
      drawerEnableOpenDragGesture: true,
      drawer: CustomDrawer(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 208, 207, 247), // Purplish color (top)
              Colors.white, // White color (bottom)
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Builder(builder: (context) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: IconButton(
                    onPressed: () => Scaffold.of(context).openDrawer(),
                    icon: Icon(Icons.menu),
                    color: Colors.black,
                    iconSize: 30, // Decreased icon size
                  ),
                );
              }),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: const Text(
                  "Dashboard",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30, // Decreased font size
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 50),
                child: Text(
                  "Welcome back Rachel. Here’s an overview of all that’s been happening",
                  style: TextStyle(
                      fontSize: 14, color: Colors.black), // Decreased font size
                ),
              ),
              SizedBox(height: 20), // Adjusted spacing

              // GridView for Cards
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics:
                      NeverScrollableScrollPhysics(), // Disable Grid scroll
                  children: [
                    _buildCard(
                      icon: Icons.file_copy, // Replace with your icon
                      title: "TOTAL DOCUMENTS",
                      number: "122",
                      description: "RockStar! You care for your loved one",
                    ),
                    _buildCard(
                      icon: Icons.check_circle, // Replace with your icon
                      title: "PERSONAL DOCUMENTS",
                      number: "75",
                      description:
                          "Superb! You’re in control of your health records.",
                    ),
                    _buildCard(
                      icon: Icons.notifications, // Replace with your icon
                      title: "LINKED ACCOUNTS",
                      number: "5",
                      description:
                          "Connected. Your loved ones are well protected.",
                      isFullWidth: true,
                    ),
                  ],
                ),
              ),

              // Upload Document Button
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          vertical: 12, // Adjusted vertical padding
                          horizontal: 15), // Adjusted horizontal padding
                      backgroundColor: Color(0xFF5341CB),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    onPressed: () => showAddDocumentDialog(context),
                    child: Text(
                      "Upload Documents",
                      style: TextStyle(fontSize: 12), // Decreased font size
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10), // Added spacing

              // Document List
              Obx(() => ListView.builder(
                    shrinkWrap:
                        true, // Make the ListView adjust to content size
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.documents.length,
                    itemBuilder: (context, index) {
                      final document = controller.documents[index];
                      return Card(
                        color: Colors.white,
                        margin: EdgeInsets.all(10),
                        child: Padding(
                          padding:
                              EdgeInsets.only(left: 20, top: 20, bottom: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Example for Name
                                        RichText(
                                          text: TextSpan(
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors
                                                    .black), // Default style for the actual text
                                            children: [
                                              TextSpan(
                                                text: 'Name: ', // Label in grey
                                                style: TextStyle(
                                                    color: Colors
                                                        .grey), // Grey color for the label
                                              ),
                                              TextSpan(
                                                text: document
                                                    .name, // Actual name in black
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black,
                                                ), // Black and bold for emphasis
                                              ),
                                            ],
                                          ),
                                          overflow: TextOverflow
                                              .ellipsis, // Handle long names
                                          maxLines: 1, // Limit to 1 line
                                        ),
                                        SizedBox(height: 8),

// Example for Description
                                        RichText(
                                          text: TextSpan(
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors
                                                    .black), // Default style for the actual text
                                            children: [
                                              TextSpan(
                                                text:
                                                    'Description: ', // Label in grey
                                                style: TextStyle(
                                                    color: Colors
                                                        .grey), // Grey color for the label
                                              ),
                                              TextSpan(
                                                text: document
                                                    .description, // Actual description in black
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors
                                                        .black), // Black for actual text
                                              ),
                                            ],
                                          ),
                                          overflow: TextOverflow
                                              .ellipsis, // Handle long descriptions
                                          maxLines: 2, // Limit to 2 lines
                                        ),
                                        SizedBox(height: 8),

// Example for Type
                                        RichText(
                                          text: TextSpan(
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors
                                                    .black), // Default style for the actual text
                                            children: [
                                              TextSpan(
                                                text: 'Type: ', // Label in grey
                                                style: TextStyle(
                                                    color: Colors
                                                        .grey), // Grey color for the label
                                              ),
                                              TextSpan(
                                                text: document
                                                    .type, // Actual type in black

                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors
                                                        .black), // Black for actual text
                                              ),
                                            ],
                                          ),
                                          overflow: TextOverflow
                                              .ellipsis, // Handle long types
                                          maxLines: 1, // Limit to 1 line
                                        ),
                                        SizedBox(height: 8),

// Example for Added by
                                        RichText(
                                          text: TextSpan(
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors
                                                    .black), // Default style for the actual text
                                            children: [
                                              TextSpan(
                                                text:
                                                    'Added by: ', // Label in grey
                                                style: TextStyle(
                                                    color: Colors
                                                        .grey), // Grey color for the label
                                              ),
                                              TextSpan(
                                                text: document
                                                    .addedBy, // Actual addedBy in black
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors
                                                        .black), // Black for actual text
                                              ),
                                            ],
                                          ),
                                          overflow: TextOverflow
                                              .ellipsis, // Handle long addedBy text
                                          maxLines: 1, // Limit to 1 line
                                        ),
                                        SizedBox(height: 8),

// Example for Tags
                                        RichText(
                                          text: TextSpan(
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors
                                                    .black), // Default style for the actual text
                                            children: [
                                              TextSpan(
                                                text: 'Tags: ', // Label in grey
                                                style: TextStyle(
                                                    color: Colors
                                                        .grey), // Grey color for the label
                                              ),
                                              TextSpan(
                                                text: document.tags.join(
                                                    ', '), // Actual tags in black, joined by commas
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors
                                                        .black), // Black for actual text
                                              ),
                                            ],
                                          ),
                                          overflow: TextOverflow
                                              .ellipsis, // Handle long tags text
                                          maxLines: 1, // Limit to 1 line
                                        ),
                                        SizedBox(height: 8),
                                        RichText(
                                          text: TextSpan(
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors
                                                    .black), // Default style for the actual text
                                            children: [
                                              TextSpan(
                                                text:
                                                    'Image: ', // Label in grey
                                                style: TextStyle(
                                                    color: Colors
                                                        .grey), // Grey color for the label
                                              ),
                                              TextSpan(
                                                text: document.fileName,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors
                                                        .black), // Black for actual text
                                              ),
                                            ],
                                          ),
                                          overflow: TextOverflow
                                              .ellipsis, // Handle long tags text
                                          maxLines: 1, // Limit to 1 line
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Spacer(),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          // Edit action
                                        },
                                        icon: Icon(Icons.edit,
                                            color: Colors.black),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          controller.deleteDocument(index);
                                        },
                                        icon: Icon(Icons.delete,
                                            color: Colors.red),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard({
    required IconData icon,
    required String title,
    required String number,
    required String description,
    bool isFullWidth = false,
  }) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Padding(
        padding: EdgeInsets.all(15), // Decreased padding
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              // Decreased padding
              child: Icon(
                icon,
                color: Color(0xFF5341CB), // Purple color for the icon
                size: 24, // Decreased icon size
              ),
            ),
            SizedBox(width: 8), // Decreased spacing
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 14)), // Decreased font size
                  Text(number,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)), // Decreased font size
                  Text(description,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12)), // Decreased font size
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showAddDocumentDialog(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    final TextEditingController typeController = TextEditingController();
    final TextEditingController addedByController = TextEditingController();
    final TextEditingController tagsController = TextEditingController();
    String? fileName; // Variable to hold the selected file name
    final ImagePicker _picker =
        ImagePicker(); // Create an instance of ImagePicker

    Get.dialog(
      AlertDialog(
        title: Text('Add Document'),
        content: Container(
          height: 450, // Adjusted height for additional field space
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Document Name'),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: descriptionController,
                  maxLines: 3,
                  decoration:
                      InputDecoration(labelText: 'Document Description'),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: typeController,
                  decoration: InputDecoration(labelText: 'Document Type'),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: addedByController,
                  decoration: InputDecoration(labelText: 'Added by'),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: tagsController,
                  decoration: InputDecoration(labelText: 'Tags'),
                ),
                SizedBox(height: 20), // Added spacing
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        vertical: 12, // Adjusted vertical padding
                        horizontal: 15), // Adjusted horizontal padding
                    backgroundColor: Color(0xFF5341CB),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onPressed: () async {
                    final XFile? pickedFile = await _picker.pickImage(
                      source: ImageSource.gallery,
                    );
                    if (pickedFile != null) {
                      fileName = pickedFile.name; // Set the selected file name
                      print("Selected file: $fileName"); // Print the file name
                    }
                  },
                  child: Text('Select Document'),
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text(
              'Cancel',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              if (nameController.text.isNotEmpty) {
                final newDocument = Document(
                    id: '',
                    name: nameController.text,
                    description: descriptionController.text,
                    type: typeController.text,
                    addedBy: addedByController.text,
                    tags: tagsController.text.split(','),
                    fileName: fileName);
                controller.addDocument(newDocument);
                Get.back();
              }
            },
            child: Text(
              'Add',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
