// import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';
// import 'package:pretty_dio_logger/pretty_dio_logger.dart';

// class DioClient {
//   final Dio _dio;

//   DioClient(this._dio) {
//     _dio
//       ..options.baseUrl = Endpoints.baseUrl
//       ..options.connectTimeout =
//           const Duration(milliseconds: Endpoints.connectionTimeout)
//       ..options.receiveTimeout =
//           const Duration(milliseconds: Endpoints.receiveTimeout)
//       ..options.responseType = ResponseType.json
//       ..interceptors.add(PrettyDioLogger(
//         requestHeader: false,
//         requestBody: false,
//         responseBody: false,
//         responseHeader: false,
//         error: true,
//         compact: true,
//       ));
//   }

//   // Add methods...
//   // Get:-----------------------------------------------------------------------
//   Future<Response> get(String url,
//       {Map<String, dynamic>? queryParameters,
//       Options? options,
//       CancelToken? cancelToken,
//       ProgressCallback? onReceiveProgress}) async {
//     try {
//       debugPrint(
//           "base url: ${Endpoints.baseUrl} endpoint: $url queryParameters: $queryParameters");
//       Response response = await _dio.get(
//         url,
//         queryParameters: queryParameters,
//         options: options,
//         cancelToken: cancelToken,
//         onReceiveProgress: onReceiveProgress,
//       );
//       return response;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   // Post:----------------------------------------------------------------------
//   Future<Response> post(
//     String url, {
//     data,
//     Map<String, dynamic>? queryParameters,
//     Options? options,
//     CancelToken? cancelToken,
//     ProgressCallback? onSendProgress,
//     ProgressCallback? onReceiveProgress,
//   }) async {
//     try {
//       debugPrint(
//           "base url: ${Endpoints.baseUrl} endpoint: $url queryParameters: $queryParameters");
//       final Response response = await _dio.post(
//         url,
//         data: data,
//         queryParameters: queryParameters,
//         options: options,
//         cancelToken: cancelToken,
//         onSendProgress: onSendProgress,
//         onReceiveProgress: onReceiveProgress,
//       );
//      // print(response.data);
//      // print(response.statusMessage);
//       return response;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   // // Upload:----------------------------------------------------------------------
//   // Future<Response> upload(
//   //   String url, {
//   //   data,
//   //   Map<String, dynamic>? queryParameters,
//   //   Options? options,
//   //   CancelToken? cancelToken,
//   //   ProgressCallback? onSendProgress,
//   //   ProgressCallback? onReceiveProgress,
//   // }) async {
//   //   try {
//   //     debugPrint(
//   //         "base url: ${Endpoints.baseUrl} endpoint: $url queryParameters: $queryParameters");
//   //     final Response response = await _dio.post(
//   //       url,
//   //       data: data,
//   //       queryParameters: queryParameters,
//   //       options: options,
//   //       cancelToken: cancelToken,
//   //       onSendProgress: onSendProgress,
//   //       onReceiveProgress: onReceiveProgress,
//   //     );
//   //     return response;
//   //   } catch (e) {
//   //     rethrow;
//   //   }
//   // }

//   // Put:-----------------------------------------------------------------------
//   Future<Response> put(
//     String url, {
//     data,
//     Map<String, dynamic>? queryParameters,
//     Options? options,
//     CancelToken? cancelToken,
//     ProgressCallback? onSendProgress,
//     ProgressCallback? onReceiveProgress,
//   }) async {
//     try {
//       debugPrint(
//           "base url: ${Endpoints.baseUrl}endpoint: $url queryParameters: $queryParameters");
//       final Response response = await _dio.put(
//         url,
//         data: data,
//         queryParameters: queryParameters,
//         options: options,
//         cancelToken: cancelToken,
//         onSendProgress: onSendProgress,
//         onReceiveProgress: onReceiveProgress,
//       );
//       return response;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   // Delete:--------------------------------------------------------------------
//   Future<dynamic> delete(
//     String url, {
//     data,
//     Map<String, dynamic>? queryParameters,
//     Options? options,
//     CancelToken? cancelToken,
//     ProgressCallback? onSendProgress,
//     ProgressCallback? onReceiveProgress,
//   }) async {
//     try {
//       debugPrint(
//           "base url: ${Endpoints.baseUrl}endpoint: $url queryParameters: $queryParameters");
//       final Response response = await _dio.delete(
//         url,
//         data: data,
//         queryParameters: queryParameters,
//         options: options,
//         cancelToken: cancelToken,
//       );
//       return response.data;
//     } catch (e) {
//       rethrow;
//     }
//   }
// }

// class Endpoints {
//   // Endpoints();

//   //baseUrl
//   // static const String baseUrl = "http://127.0.0.1:3000/api/";
//   // static const String baseUrl = "http://localhost:3000"; // prod url
//   static const String baseUrl =
//       "https://alliedtechnologies.cloud/clients/tailured/api/v1/"; // prod url

//   // receiveTimeout
//   static const int receiveTimeout = 120 * 100; // 12 sec

//   // connectTimeout
//   static const int connectionTimeout = 120 * 100; // 12 sec
// }
