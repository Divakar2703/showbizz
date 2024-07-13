// import 'dart:io';

// import 'package:hive/hive.dart';
// import 'package:path_provider/path_provider.dart';

// class AppHive {
//   static setHive(boxName, key, value) async {
//     await Hive.openBox('$boxName');
//     var box = Hive.box('$boxName');
//     box.put('$key', value);
//     return value;
//   }

//   static Future getHive(boxName, key) async {
//     await Hive.openBox('$boxName');
//     var box = Hive.box('$boxName');
//     return box.get('$key');
//   }

//   static initHive(boxName) async {
//     final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
//     var path = appDocumentsDir.path;
//     Hive.init(path);
//     await Hive.openBox('$boxName');
//   }

//   static Future<void> initAllHive(List<String> boxNames) async {
//     final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
//     Hive.init(appDocumentsDir.path);
//     for (String boxName in boxNames) {
//       await Hive.openBox(boxName);
//     }
//   }

//   static Future<void> clearHive(List<String> boxNames) async {
//     final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
//     Hive.init(appDocumentsDir.path);

//     for (String boxName in boxNames) {
//       await Hive.openBox(boxName);
//       await Hive.box(boxName).clear(); // Clears the data in the specified box
//     }
//   }
// }
