import 'package:get/get.dart';
import 'package:showbiz/api_helpers/api_manager.dart';
import 'package:showbiz/api_helpers/api_param.dart';
import 'package:showbiz/api_helpers/api_utils.dart';
import 'package:showbiz/dialogs/app_dialogs.dart';
import 'package:showbiz/models/business_model.dart';
import 'package:showbiz/models/categories_model.dart';

class UserHomeController extends GetxController {
  bool isLoading = false;
  List<Categories> categories = [];
  List<Business> businesses = [];
  void onInit() {
    getCategories();
    getBusinesses();
    super.onInit();
  }

  Future<void> getCategories() async {
    isLoading = true;
    update();
    ApiManager.callPost({
      ApiParam.request: Requests.getCategories,
    }, endPoint: ApiUtils.getCategory)
        .then((value) {
      isLoading = false;
      CategoriesModel cat = CategoriesModel.fromJson(value);
      categories = cat.categories ?? [];
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

  Future<void> getBusinesses() async {
    isLoading = true;
    update();
    ApiManager.callPost({
      ApiParam.request: Requests.getBusiness,
    }, endPoint: ApiUtils.business)
        .then((value) {
      isLoading = false;
      BusinessModel busi = BusinessModel.fromJson(value);
      businesses = busi.business ?? [];
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
