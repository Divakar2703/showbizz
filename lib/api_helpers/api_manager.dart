import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:showbiz/api_helpers/api_utils.dart';
import 'package:showbiz/utils/app_function.dart';
import 'package:showbiz/utils/app_strings.dart';

class ApiManager {
  static Future<Map<String, dynamic>> callPost(
    Map<String, String> body, {
    String? endPoint,
  }) async {
    // log("Hello");
    bool isNet = await AppFunctions.checkInternet();
    if (isNet) {
      try {
        // log(body.toString());
        log(ApiUtils.baseUrl + (endPoint ?? ""));
        Map<String, dynamic> finalresponse;
        Uri url = Uri.parse(ApiUtils.baseUrl + (endPoint ?? ""));
        http.Response response = await http.post(url, body: body);
        log(response.body.toString());
        finalresponse = checkResponse(response);
        log(finalresponse.toString());
        return finalresponse;
      } on SocketException catch (_) {
        throw AppString.checkConnection;
      }
    } else {
      throw AppString.checkConnection;
    }
  }

  static Future<Map<String, dynamic>> callMultiPartPost(
    Map<String, String> body, {
    required String imgParam,
    String? imgPath,
    List<String>? imgPathList,
    String? endPoint,
  }) async {
    bool isNet = await AppFunctions.checkInternet();
    if (isNet) {
      try {
        Map<String, dynamic> finalresponse;
        Uri url = Uri.parse(ApiUtils.baseUrl + (endPoint ?? ""));

        var request = http.MultipartRequest('POST', url);

        request.fields.addAll(body);
        if (imgPath != null) {
          // print("elements");
          request.files
              .add(await http.MultipartFile.fromPath(imgParam, imgPath));
        } else {
          // print("element");
          List<http.MultipartFile> files = [];
          for (String element in imgPathList!) {
            // print(element);
            var f = await http.MultipartFile.fromPath(imgParam, element);
            files.add(f);
          }
          request.files.addAll(files);
        }
        if (kDebugMode) {
          print("Request");
          print(request.fields);
        }
        // print("imgPath");
        // print(imgPath);
        // print(request.url);
        var response = await request.send();
        // print(response.toString());
        // print(response.headers);
        http.Response responsed = await http.Response.fromStream(response);

        finalresponse = checkResponse(responsed);

        return finalresponse;
      } on SocketException catch (_) {
        throw AppString.checkConnection;
      }
    } else {
      throw AppString.checkConnection;
    }
  }

  static Map<String, dynamic> checkResponse(http.Response response) {
    Map<String, dynamic> data = json.decode(response.body);
    String status = data['status'];

    if (response.statusCode == 200) {
      if (status == 'success') {
        return data;
      } else {
        throw data['message'];
      }
    } else if (response.statusCode == 401 &&
        data['reason'] == 'session token invalid or expired') {
      //StorageHelper().removeUser();
      throw data['message'];
    } else {
      throw data['message'];
    }
  }
}
