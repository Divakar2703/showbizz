import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:showbiz/models/auth_model.dart';

class StorageHelper {
  get storage => GetStorage();

  removeUser() async {
    await storage.erase();
    await Get.deleteAll();
    // Get.offAll(() => JoinScreen());
    // await storage.remove('isLoggedIn');
    // await storage.remove('loginData');
  }

  set isLoggedIn(bool value) => storage.write("isLoggedIn", value);
  bool get isLoggedIn => storage.read('isLoggedIn') ?? false;

  set selectedUser(String value) => storage.write("selectedUser", value);
  String get selectedUser => storage.read('selectedUser') ?? null;

  set isGuest(bool value) => storage.write("isGuest", value);
  bool get isGuest => storage.read("isGuest") ?? false;

  // set isRegiUser(bool value) => storage.write("isRegiUser", value);
  // bool get isRegiUser => storage.read('isRegiUser') ?? false;

  // set isLevelCom(bool value) => storage.write("isLevelCom", value);
  // bool get isLevelCom => storage.read('isLevelCom') ?? false;

  set authData(AuthData data) => storage.write("authData", json.encode(data));

  AuthData get authData {
    final parsed = json.decode(storage.read("authData") ?? "{}");
    return AuthData.fromJson(parsed);
  }
}
