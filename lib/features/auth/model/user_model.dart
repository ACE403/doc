// import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../utils/formatters/formatter.dart';

class UserModel {
  // Keep those values final which you do not want to update
  final String id;
  String fullName;
  final String email;
  String phoneNumber;
  String pin; // Pin is expected to be in string form (from Pinput).

  /// Constructor for UserModel.
  UserModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.pin, // New pin field.
  });

  // /// Helper function to split full name into first and last name.
  // String get firstName => fullName.split(" ").first;
  // String get lastName =>
  //     fullName.split(" ").length > 1 ? fullName.split(" ").last : '';

  // /// Helper function to format phone number.
  // // Assuming Formatter is a utility class you've created elsewhere.
  // String get formattedPhoneNo => Formatter.formatPhoneNumber(phoneNumber);

  // /// Static function to generate a username from the full name.
  // static String generateUsername(String fullName) {
  //   List<String> nameParts = fullName.split(" ");
  //   String firstName = nameParts[0].toLowerCase();
  //   String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : '';
  //   return "$firstName$lastName";
  // }

  // /// Static function to create an empty user model.
  // static UserModel empty() {
  //   return UserModel(
  //     id: '', // Empty or default value
  //     fullName: '', // Empty or default value
  //     email: '', // Empty or default value
  //     phoneNumber: '', // Empty or default value
  //     pin: '', // Empty or default value
  //   );
  // }

  // /// Convert model to JSON structure for storing data in Firebase.
  // Map<String, dynamic> toJson() {
  //   return {
  //     'FullName': fullName,
  //     'Email': email,
  //     'PhoneNumber': phoneNumber,
  //     'Pin': pin, // Added pin field to the JSON.
  //   };
  // }

  // /// Factory method to create a UserModel from a Firebase document snapshot.
  // factory UserModel.fromSnapshot(
  //     DocumentSnapshot<Map<String, dynamic>> document) {
  //   if (document.data() != null) {
  //     final data = document.data()!;
  //     return UserModel(
  //       id: document.id,
  //       fullName: data['FullName'] ?? '',
  //       email: data['Email'] ?? '',
  //       phoneNumber: data['PhoneNumber'] ?? '',
  //       pin: data['Pin'] ?? '', // Fetch pin from Firestore.
  //     );
  //   } else {
  //     // Handle the case where the document data is null, if necessary.
  //     throw Exception('Document data is null');
  //   }
  // }
}
