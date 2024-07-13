// import 'package:dio/dio.dart';
// import 'package:get_it/get_it.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:showbiz/core/api_services.dart';

// import 'dio_client.dart';

// // counsellor repo imports...

// GetIt getIt = GetIt.instance;

// class ServiceLocator {
//   Future<void> setup() async {
//     print("service locator setup...");
//     await GetStorage.init();
//     getIt.registerSingleton(Dio());
//     getIt.registerSingleton(DioClient(getIt<Dio>()));
//     getIt.registerSingleton(ApiService(dioClient: getIt<DioClient>()));

//     // getIt.registerSingleton(AuthRepo(getIt.get<ApiService>()));
//   }
// }
