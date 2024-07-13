import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:showbiz/api_helpers/api_manager.dart';
import 'package:showbiz/api_helpers/api_param.dart';
import 'package:showbiz/api_helpers/api_utils.dart';
import 'package:showbiz/dialogs/app_dialogs.dart';
import 'package:showbiz/helpers/storage_helper.dart';
import 'package:showbiz/models/non_interactive_sessions_model.dart';

class HomeController extends GetxController {
  TextEditingController url = TextEditingController();
  bool liveFeed = true;
  List<LiveSession> nonInteractiveSessions = [];
  changeLiveFeed(status) {
    print(status);
    if (status) {
      liveFeed = true;
    } else {
      liveFeed = false;
    }
    update();
  }

  bool isLoading = true;

  void onInit() {
    getNonInteractiveSessions();

    super.onInit();
  }

  Future<void> getNonInteractiveSessions() async {
    isLoading = true;
    update();
    ApiManager.callPost({
      ApiParam.request: Requests.getSessions,
      ApiParam.businessId: StorageHelper().authData.userId ?? "",
      ApiParam.token: StorageHelper().authData.token ?? "",
    }, endPoint: ApiUtils.saveBusiness)
        .then((value) {
      log(value.toString());
      isLoading = false;
      NonInteractiveSessionModel sessions =
          NonInteractiveSessionModel.fromJson(value);
      nonInteractiveSessions = sessions.liveSession ?? [];
      // AuthModel authModel = AuthModel.fromJson(value);

      update();
    }).onError(
      (error, stackTrace) {
        isLoading = false;
        update();
        AppDialogs.errorSnackBar(error.toString());
      },
    );
  }

  Future<void> addNonInteractiveSessions() async {
    isLoading = true;
    update();
    ApiManager.callPost({
      ApiParam.request: Requests.addSession,
      ApiParam.businessId: StorageHelper().authData.userId ?? "",
      ApiParam.url: url.text,
      ApiParam.token: StorageHelper().authData.token ?? "",
    }, endPoint: ApiUtils.saveBusiness)
        .then((value) {
      isLoading = false;
      getNonInteractiveSessions();
      // AuthModel authModel = AuthModel.fromJson(value);

      update();
    }).onError(
      (error, stackTrace) {
        isLoading = false;
        update();
        AppDialogs.errorSnackBar(error.toString());
      },
    );
  }
}
