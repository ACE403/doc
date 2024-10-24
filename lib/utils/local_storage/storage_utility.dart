// import 'package:get_storage/get_storage.dart';

// class LocalStorage {
//   static LocalStorage? _instance;

//   late final GetStorage _storage;
//   LocalStorage._internal();

//   factory LocalStorage.instance() {
//     _instance ?? LocalStorage._internal();
//     return _instance!;
//   }

//   // Generic method to save data
//   Future<void> saveData<T>(String key, T value) async {
//     await _storage.write(key, value);
//   }

//   static Future<void> init(String bucketName) async {
//     await GetStorage.init(bucketName);

//     _instance = LocalStorage._internal();
//     _instance!._storage = GetStorage(bucketName);
//   }

//   // Generic method to read data
//   T? readData<T>(String key) {
//     return _storage.read<T>(key);
//   }

//   Future<void> writeData<T>(String key, T value) async {
//     await _storage.write(key, value);
//   }

//   // Generic method to remove data
//   Future<void> removeData(String key) async {
//     await _storage.remove(key);
//   }

//   // Clear all data in storage
//   Future<void> clearAll() async {
//     await _storage.erase();
//   }
// }
