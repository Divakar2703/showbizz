import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:showbiz/api_helpers/api_manager.dart';
import 'package:showbiz/api_helpers/api_param.dart';
import 'package:showbiz/api_helpers/api_utils.dart';
import 'package:showbiz/dialogs/app_dialogs.dart';
import 'package:showbiz/helpers/storage_helper.dart';
import 'package:showbiz/models/business_details_model.dart';

class BusinessDetailsController extends GetxController {
  bool isLoading = false;
  BusinessDetails? businessDetails;
  List<NonInteractiveSession> liveSessions = [];
  Future<void> getBusinessDetails(String businessId) async {
    isLoading = true;
    update();
    ApiManager.callPost({
      ApiParam.request: Requests.getBusnessDetails,
      ApiParam.businessId: businessId,
      ApiParam.token: StorageHelper().authData.token!,
    }, endPoint: ApiUtils.saveBusiness)
        .then((value) {
      isLoading = false;
      BusinessDetailsModel biz = BusinessDetailsModel.fromJson(value);
      liveSessions = biz.nonInteractiveSession ?? [];
      businessDetails = biz.businessDetails;

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
