import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class AppFunctions {
  static Future<bool> checkInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  static Future<String?> selectImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: image.path,
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 75,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        uiSettings: [
          AndroidUiSettings(
              // toolbarTitle: AppStrings.imgCropper,
              // toolbarColor: AppColors.secondaryColor,
              // toolbarWidgetColor: AppColors.primaryColor,
              // initAspectRatio: CropAspectRatioPreset.original,
              // backgroundColor: AppColors.secondaryColor,
              // lockAspectRatio: false,
              ),
          IOSUiSettings(
            title: "Rise + Restore",
          ),
        ],
      );
      if (croppedFile != null) {
        return croppedFile.path;
      }
    }
    return null;
  }

  // static Future<void> launchInstra(String uName) async {
  //   // String nativeUrl = "instagram://user?username=$uName";
  //   if (uName.isNotEmpty) {
  //     String webUrl = "https://www.instagram.com/$uName/";
  //     try {
  //       await launchInstra(uName);
  //     } catch (e) {
  //       launchUrl(Uri.parse(webUrl));
  //     }
  //   }
  //   // if (await cn(Uri.parse(nativeUrl))) {
  //   //   await launchInstra(uName);
  //   // } else if (await canLaunchUrl(webUrl)) {
  //   //   await launch(webUrl);
  //   // }
  // }

  // static String getGroupId(String id) {
  //   String cId =
  //       StorageHelper().isCustomer ? '8' : StorageHelper().authData.userId!;

  //   if (id.hashCode < cId.hashCode) {
  //     return '${id}_$cId';
  //   } else {
  //     return '${cId}_$id';
  //   }
  // }

  static String getMobileFormat(String mobile) {
    if (mobile.length == 10) {
      return mobile.replaceAllMapped(
          RegExp(r'(\d{3})(\d{3})(\d+)'), (m) => "(${m[1]}) ${m[2]} ${m[3]}");
    }
    return mobile;
  }
}
