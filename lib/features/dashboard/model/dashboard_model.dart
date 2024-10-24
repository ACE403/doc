class Document {
  final String id;
  final String name;
  final String description;
  final String type;
  final String addedBy;
  final List<String> tags;
  final String? fileName; // Add this line

  Document({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.addedBy,
    required this.tags,
    this.fileName, // Update this line
  });

//   // Method to convert a Document object to JSON
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id, // Include id in JSON
//       'name': name,
//       'description': description,
//       'type': type,
//       'addedBy': addedBy,
//       'tags': tags,
//     };
//   }

//   // Factory method to create a Document from a Firestore DocumentSnapshot
//   factory Document.fromSnapshot(
//       DocumentSnapshot<Map<String, dynamic>> document) {
//     if (document.data() != null) {
//       final data = document.data()!;
//       return Document(
//         id: document.id, // Set id from the snapshot's document ID
//         name: data['name'] ?? '',
//         description: data['description'] ?? '',
//         type: data['type'] ?? '',
//         addedBy: data['addedBy'] ?? '',
//         tags: List<String>.from(data['tags'] ?? []),
//       );
//     } else {
//       // Handle the case where the document data is null, if necessary.
//       throw Exception('Document data is null');
//     }
//   }

//   // Method to convert a Document object to a Firestore map
//   Map<String, dynamic> toFirestore() {
//     return {
//       'name': name,
//       'description': description,
//       'type': type,
//       'addedBy': addedBy,
//       'tags': tags,
//     };
//   }
}
