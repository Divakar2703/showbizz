// // import 'package:tailured/data/models/login_model.dart';
// // import 'package:tailured/data/models/register_model.dart';
// import 'package:showbiz/core/api_services.dart'; 
// import 'dart:convert';
// import 'package:dio/dio.dart'; 
// import 'package:flutter/foundation.dart';
// import 'package:get_storage/get_storage.dart';

// class AuthRepo {
//   final ApiService apiService;
//   AuthRepo(this.apiService);

//   Future<Either<String, ProfessionModel>> getProfessions() async {
//     try {
//       final response = await apiService.getProfessions();
//       // debugPrint(response.toString());
//       // debugPrint(response.runtimeType.toString());
//       var resp = json.decode(response.toString());
//       // debugPrint(resp.message.toString());
//       ProfessionModel professionModel = ProfessionModel.fromJson(resp);
//       return right(professionModel);
//     } on DioError catch (e) {
//       // final errorMessage = DioExceptions.fromDioError(e).toString();
//       debugPrint(e.response?.data.toString());
//       return left("${e.response?.data.toString()}");
//     }
//   }

//   Future<Either<String, GenreModel>> getGenres() async {
//     try {
//       final response = await apiService.getGenres();
//       // debugPrint(response.toString());
//       // debugPrint(response.runtimeType.toString());
//       var resp = json.decode(response.toString());
//       // debugPrint(resp.message.toString());
//       GenreModel genreModel = GenreModel.fromJson(resp);
//       return right(genreModel);
//     } on DioError catch (e) {
//       // final errorMessage = DioExceptions.fromDioError(e).toString();
//       debugPrint(e.response?.data.toString());
//       return left("${e.response?.data.toString()}");
//     }
//   }

//   Future<Either<dynamic, SignupModel>> studentSignup(
//       String name,
//       String username,
//       String password,
//       String schoolname,
//       String schoolemail,
//       String categories,
//       String genres) async {
//     try {
//       final response = await apiService.registerStudent({
//         'api_key':
//             'ui908367yY80iJhY77gGY88uH8990IRt54rDFcdsWeOipOiJgTG54dDt6yH',
//         'name': name,
//         'email': schoolemail,
//         'password': password,
//         'schoolname': schoolname,
//         'genres': genres,
//         'categories': categories,
//         'username': username
//       });
//       var resp = json.decode(response.toString());
//       SignupModel signupModel = SignupModel.fromJson(resp);
//       return right(signupModel);
//     } on DioException catch (e) {
//       // final errorMessage = DioExceptions.fromDioError(e).toString();
//       debugPrint(e.response?.data.toString());
//       return left(json.decode(e.response?.data));
//     }
//   }

//   Future<Either<dynamic, SignupModel>> userSignup(
//     String name,
//     String username,
//     String password,
//     String email,
//     String phone,
//     String categories,
//     String genres,
//     String facebook,
//     String instagram,
//     String twitter,
//     String tiktok,
//   ) async {
//     try {
//       final response = await apiService.registerUser({
//         'api_key':
//             'ui908367yY80iJhY77gGY88uH8990IRt54rDFcdsWeOipOiJgTG54dDt6yH',
//         'name': name,
//         'username': username,
//         'password': password,
//         'email': email,
//         'phone': phone,
//         'genres': genres,
//         'categories': categories,
//         'social_fb': facebook,
//         'social_instagram': instagram,
//         'social_tiktok': tiktok,
//         'social_twitter': twitter
//       });
//       var resp = json.decode(response.toString());
//       SignupModel signupModel = SignupModel.fromJson(resp);
//       return right(signupModel);
//     } on DioException catch (e) {
//       debugPrint(e.response?.data.toString());
//       return left(json.decode(e.response?.data));
//     }
//   }

//   Future<Either<dynamic, LoginModel>> studentLogin(
//     String email,
//     String password,
//   ) async {
//     try {
//       final response = await apiService.loginStudent({
//         'api_key':
//             'ui908367yY80iJhY77gGY88uH8990IRt54rDFcdsWeOipOiJgTG54dDt6yH',
//         'email': email,
//         'password': password
//       });
//       var resp = json.decode(response.toString());
//       LoginModel loginModel = LoginModel.fromJson(resp);
//       return right(loginModel);
//     } on DioException catch (e) {
//       // final errorMessage = DioExceptions.fromDioError(e).toString();
//       debugPrint(e.response?.data.toString());
//       return left(json.decode(e.response?.data));
//     }
//   }

//   Future<Either<dynamic, LoginModel>> userLogin(
//     String email,
//     String password,
//   ) async {
//     try {
//       final response = await apiService.loginUser({
//         'api_key':
//             'ui908367yY80iJhY77gGY88uH8990IRt54rDFcdsWeOipOiJgTG54dDt6yH',
//         'email': email,
//         'password': password
//       });
//       var resp = json.decode(response.toString());
//       LoginModel loginModel = LoginModel.fromJson(resp);
//       return right(loginModel);
//     } on DioException catch (e) {
//       debugPrint(e.response?.data.toString());
//       return left(json.decode(e.response?.data));
//     }
//   }

//   Future<Either<String, dynamic>> getUserProfile() async {
//     try {
//       var userId = GetStorage().read("user_id");
//       final response = await apiService
//           .profile({"user_id": userId, "profile": "profile@d2"});
//       debugPrint(response.toString());
//       debugPrint(response.runtimeType.toString());
//       var resp = json.decode(response.toString());
//       // debugPrint(resp.message.toString());
//       return right(resp);
//     } on DioError catch (e) {
//       // final errorMessage = DioExceptions.fromDioError(e).toString();
//       debugPrint(e.response?.data.toString());
//       return left("${e.response?.data.toString()}");
//     }
//   }

//   Future<Either<String, dynamic>> forgotPassword(
//       String newPassword, String phone) async {
//     try {
//       final response = await apiService.forgotPassword({
//         "forgot_password": "forgot_password@d2",
//         "phone": phone,
//         "new_password": newPassword
//       });
//       debugPrint(response.toString());
//       debugPrint(response.runtimeType.toString());
//       var resp = json.decode(response.toString());
//       // debugPrint(resp.message.toString());
//       return right(resp);
//     } on DioError catch (e) {
//       // final errorMessage = DioExceptions.fromDioError(e).toString();
//       debugPrint(e.response?.data.toString());
//       return left("${e.response?.data.toString()}");
//     }
//   }
// }
