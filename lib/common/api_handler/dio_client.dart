

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'package:ua_client_hints/ua_client_hints.dart';


import 'package:ipo_tracker/di/injection_container.dart';
import 'package:ipo_tracker/secure_storage/app_shared_preferences.dart';
import 'package:ipo_tracker/util/constants/api_end_point_constant.dart';
import 'package:ipo_tracker/util/utility.dart';
import 'package:ipo_tracker/common/api_handler/api_client.dart';

class DioClient {
  final dio = getIt<Dio>();
final serviceLocator=  getIt<ApiWrapper>();
  // Send a POST request with the provided parameters
  Future<Map<String, dynamic>?> doPost(String endpoint, Map<String, dynamic> params, {required bool isAuthRequired, required bool passInParameters}) async {
    return await serviceLocator.doRequest(endpoint, params,
        isAuthRequired: isAuthRequired,
        callingMethod: 'POST',
         passInParameters: passInParameters
    );
  }

// Send a POST request with the provided parameters and form data
  Future<dynamic> doPostS3File(
      String endpoint, var params, bool isAuthRequired) async {
    return await serviceLocator.doRequest(endpoint, params,
        isAuthRequired: isAuthRequired,
        callingMethod: 'POST',
        isFormData: true);
  }

// Send a GET request with the provided parameters
  Future<dynamic> doGet(String endpoint, Map<String, dynamic> params,
      {bool isCache = false}) async {
    return await serviceLocator.doRequest(endpoint, params, isCache: isCache,);
  }

// Send a PUT request with the provided parameters
  Future<Map<String, dynamic>?> doPut(
      String endpoint, Map<String, dynamic> params,
      {bool isCache = false}) async {
    // TODO: Test this with Notification update
    return await serviceLocator.doRequest(endpoint, params,
        callingMethod: 'PUT', isCache: isCache);
  }

// Get headers for the HTTP request, including user agent and authorization
  Future<Map<String, dynamic>> getHeaders(
      String uniqueKey, {
        bool? isAuthRequired,
        String? authToken,
      }) async {
    Map<String, dynamic> headers;
    headers = {
      'Content-Type': 'application/json',
      'Accept': 'text/plain',
      // "Device-Identifier": uniqueKey,
      // "User-Agent": await initPlatformState(),
    };

    if (isAuthRequired != null && isAuthRequired) {
      headers['authorization'] = (authToken != null && authToken.isNotEmpty) ? authToken : await AppSecureSharedPreferences.getUserAuthKey();
    }
    return await _addAppVersion(headers);
  }



// Add app version and build number to the request parameters
  Future<Map<String, dynamic>> _addAppVersion(
      Map<String, dynamic> params) async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final String version = packageInfo.version;
    final String buildNumber = packageInfo.buildNumber;
    params['appVersion'] = version;
    params['buildNumber'] = buildNumber;
    return params;
  }

// Send a request to retrieve binary data from the provided URL
  Future<dynamic> doByteRequest(Uri url) async {
    final response = await Dio().getUri(url,
        options: Options(responseType: ResponseType.bytes, followRedirects: false));
    return response.data;
  }



// Initialize the user agent (UA) by retrieving it asynchronously
  Future<String> initPlatformState() async => await userAgent();




  /// Refreshes the authentication token using the provided Dio instance.
  /// Returns the new access token.
  ///
  /// Parameters:
  /// - [dio]: The Dio instance for making the HTTP request.
  // Future<String> doRefreshToken() async {
  //
  //   String token = '';
  //   try {
  //     // Retrieve the refresh token from local storage
  //     final String? refreshAuthKey = await AppSecureSharedPreferences.getRefreshAuthKey();
  //     // print("getRefreshAuthKey:$refreshAuthKey");
  //
  //     // Prepare the request parameters
  //     // Map<String, dynamic> params = {
  //     //   StringConstants.refreshToken: refreshAuthKey,
  //     //  // "": refreshAuthKey,
  //     // };
  //     final Dio refreshDio = Dio(
  //       BaseOptions(
  //           baseUrl: APIEndPoint.baseURL,
  //           connectTimeout: 30000,
  //           receiveTimeout: 30000,
  //           contentType: Headers.jsonContentType,
  //           // headers: {
  //           //   "accept": "text/plain",
  //           //   "Content-Type": "application/json",
  //           // }
  //           ),
  //     );
  //
  //
  //     final json =  refreshAuthKey;
  //
  //     // //  Add the certificate to the Dio instance for secure connection
  //     // refreshDio = await addCertificate(refreshDio);
  //
  //
  //     //  Send a POST request to refresh the token
  //     // ignore: strict_raw_type
  //     final Response response = await refreshDio.post(APIEndPoint.refreshTokenUrl, data:jsonEncode(json));
  //     // Check if the response status code is 201 or 200 (success)
  //     if (response.statusCode == 201 || response.statusCode == 200) {
  //       final Map<String, dynamic>? data = response.data;
  //       if (data != null) {
  //         // Extract the new access token from the response
  //         token = response.data['result']['accessToken'];
  //
  //         // Update the user's authentication key, access token, and refresh token
  //         await AppSecureSharedPreferences.setUserAuthKey(token);
  //         await AppSecureSharedPreferences.setUserAccessToken(token);
  //         await AppSecureSharedPreferences.setRefreshAuthKey(response.data['result']['refreshToken']);
  //       }
  //     }else {
  //       await AppSecureSharedPreferences.setUserAuthKey('');
  //       await AppSecureSharedPreferences.setUserAccessToken('');
  //       await navigateToLogin();
  //     }
  //   } catch (e) {
  //     await AppSecureSharedPreferences.setUserAuthKey('');
  //     await AppSecureSharedPreferences.setUserAccessToken('');
  //     await navigateToLogin();
  //     // Handle any exceptions that occur during token refresh
  //     Utility.printLog('REFRESH TOKEN EXCEPTION ', e.toString());
  //   }
  //   return token;
  // }

  // // Adds a certificate to the provided _dio instance for secure connections
  // Future<Dio> addCertificate( Dio dio) async {
  //   var data = (await getCertificateFileFromAssets());
  //
  //   (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
  //       (client) {
  //     SecurityContext context = SecurityContext();
  //     //file is the path of certificate
  //     context.setTrustedCertificatesBytes(data.buffer.asUint8List());
  //     client.badCertificateCallback=(cert, host, port) => false;
  //     return HttpClient(context: context);
  //   };
  //   return dio;
  // }
  //
// // Loads a certificate file from the assets folder and returns it as a ByteData object
//   Future<ByteData> getCertificateFileFromAssets() async {
//
//     final appDocDir = await getApplicationDocumentsDirectory();
//     final filePath = "${appDocDir.path}/${AssetsConstant.fireBaseCertificate}";
//     File file = File(filePath);
//     List<int> bytes = await file.readAsBytes();
//     ByteData data= ByteData.view(Uint8List.fromList(bytes).buffer);
//     return data;
//   }

}