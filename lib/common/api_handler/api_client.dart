
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/foundation.dart';


import 'package:fluttertoast/fluttertoast.dart';
import 'package:ipo_tracker/util/constants/bool_constant.dart';
import 'package:ipo_tracker/util/constants/string_constant.dart';

import 'package:ipo_tracker/di/injection_container.dart';
import 'package:ipo_tracker/firebase/firebase_performance_dio/src/firebase_performance_dio.dart';
import 'package:ipo_tracker/secure_storage/app_shared_preferences.dart';
import 'package:ipo_tracker/util/constants/error_constant_string.dart';
import 'package:ipo_tracker/util/utility.dart';
import 'package:ipo_tracker/common/api_handler/dio_client.dart';
import 'package:ipo_tracker/common/api_handler/interceptor/api_intercepter.dart';
import 'package:ipo_tracker/common/api_handler/interceptor/auth_interceptor.dart';
import 'package:ipo_tracker/common/api_handler/interceptor/logger_intercepter.dart';





class ApiWrapper{
  ApiWrapper({ required Dio dioClient, required this.cancelToken}):dio=dioClient;
  /// An instance of [dio] for executing network requests.
  Dio dio;
  CancelToken cancelToken;



// This function is used to cancel any ongoing HTTP requests.
  void cancelRequests() => cancelToken.cancel('Cancelled');

// This function is used to make HTTP requests.
  Future<dynamic> doRequest(String endpoint, Map<String, dynamic> params,
      {
        bool isAuthRequired = false,       // Indicates if authentication is required for the request.
        bool isFormData = false,         // Indicates if the request uses form data.
        bool passInParameters = false,         // Indicates if the request uses form data.
        String? callingMethod,           // Name of the calling method, if provided.
        String? authToken,           // Authentication token, if provided.
        bool isCache = false             // Indicates if caching should be used for the request.
      }) async {
    // ignore: strict_raw_type
    Response? response;

    // Add a certificate to the Dio client, if needed.
    // await getIt<DioClient>().addCertificate(dio);
    try {
      // Check if there are no interceptors added to the Dio client.
      if (dio.interceptors.isEmpty) {
        // Add an authentication interceptor with the provided passportToken.
        dio.interceptors.add(AuthInterceptor(authToken ?? ''));
       // Add API-specific interceptors.
        dio.interceptors.add(ApiInterceptors());
        /// Need to check
        // Add a caching interceptor, if needed.
        // dio.interceptors.add(CacheInterceptor());

        // Add an interceptor for Firebase Performance, which helps with performance monitoring.
        // dio.interceptors.add(DioFirebasePerformanceInterceptor());

        // Add a logging interceptor for debugging purposes if the app is in debug mode.
        if (kDebugMode) dio.interceptors.add(LoggingInterceptor());


      }

      Options options;

      // Check if caching is enabled and the request method is GET.
      if (isCache && (callingMethod == null || callingMethod == 'GET')) {
        //IF METHOD IS GET AND IS_CACHE IS ENABLED
        options = buildCacheOptions(const Duration(days: 1),
            options: Options(
              followRedirects: false,
              validateStatus: (status) {
                return true;
              },
              headers:await headers(isAuthRequired, authToken),

            ),);
      } else {
        // For all other request methods or non-caching requests.
        options = Options(
          method: callingMethod,
          followRedirects: false,
          validateStatus: (status) {
            return (status! < 500);
          },
          headers: await headers(isAuthRequired, authToken),
          contentType: Headers.formUrlEncodedContentType,
        );
      }

// If the request method is GET, pass parameters as query parameters.
      if ((callingMethod == null || callingMethod == 'GET')) {
        response = await dio.request(
          endpoint,
          queryParameters: params,
          options: options,
            cancelToken: cancelToken
        );
      } else {
        // For all other request methods, handle data and parameters accordingly.
        passInParameters ?
        response = await dio.request(
            endpoint,
            queryParameters: params,
            // data: isFormData ? FormData.fromMap(params) : params,
            options: options,
            cancelToken: cancelToken
        )
        :
        response = await dio.request(
            endpoint,
            data: isFormData ? FormData.fromMap(params) : params,
            options: options,
            cancelToken: cancelToken
        );
      }


      // Handle different HTTP response statuses.
      switch (response.statusCode) {
        case 200: // Result OK
        case 201: // Result OK
          break;

        case 400: // Bad Request
          break;

        case 401: // Unauthorized
        // try again with refreshToken

        // Utility.printLog(StringConstants.error, "UnAuthorize");
        // Utility.showToast("UnAuthorized");
        // await navigateToLogin();

          break;
        case 403: // Forbidden
        case 404: // Not Found

        // final String? authKey = await AppSecureSharedPreferences.getUserAuthKey();
        // if (authKey != null &&
        //     authKey.isNotEmpty &&
        //     response.requestOptions.headers[StringConstants.authorization] != authKey) {
        //   // If the API call failed and the token is already refreshed, retry the request.
        //   return await doRequest(endpoint, params,
        //       isAuthRequired: isAuthRequired,
        //       callingMethod: callingMethod,
        //       authToken: authToken);
        // } else if (authKey != null && authKey.isNotEmpty) {
        //   // If the same token is used, it means the refresh token expired, redirect to login.
        //   await AppSecureSharedPreferences.setUserAuthKey('');
        //   await AppSecureSharedPreferences.setUserAccessToken('');
        // }
        break;
        default:
          try {
            // final Map<String, dynamic>? responseMap = response.data as Map<String, dynamic>;
            // if (responseMap != null) {
            //   if (responseMap.containsKey(StringConstants.errors) &&
            //       (responseMap[StringConstants.errors]).isNotEmpty) {
            //     // Handle API errors if present in the response.
            //     final Map<String, dynamic> error = responseMap[StringConstants.errors];
            //     Utility.showToast((error[error.keys.toList()[0]])[0]);
            //   } else if (responseMap.containsKey(StringConstants.message) &&
            //       !responseMap.containsKey(StringConstants.data)) {
            //     // Handle other types of messages in the response.
            //     final String message = responseMap[StringConstants.message];
            //     if (responseMap.containsKey(StringConstants.isPopUp)) {
            //       if (responseMap[StringConstants.isPopUp] == true) {
            //         // Handle pop-up message if needed.
            //       } else {
            //         Utility.showToast(responseMap[StringConstants.message]);
            //       }
            //     } else if (message.isNotEmpty &&
            //         !message.contains('Server Error')) {
            //       Utility.showToast(responseMap[StringConstants.message]);
            //     }
            //   }
            // } else {
            //   Fluttertoast.showToast(msg: response.statusMessage!);
            // }
          } catch (e) {
            Utility.printLog('', e.toString());
          }
          break;
      }

      // Handle the response data and format it if needed.
      if (response.data is String) {
        final Map<String, dynamic> responseMap = {
          'data': response.data
        };
        return responseMap;
      }
      return response.data;

    } on DioError catch (e) {
      // Handle Dio errors that might occur during the request.
      if (BoolConstant.repetativeApiCalling) {
        // Retry the request if needed based on the app's logic.
        return await doRequest(endpoint, params,
            isAuthRequired: isAuthRequired,
            callingMethod: callingMethod,
            authToken: authToken);
      } else {
        // Handle different types of Dio errors and show appropriate messages.
        if (e.type == DioErrorType.connectTimeout) {
          Utility.printLog('', 'SEND TIMEOUT123');
          Fluttertoast.showToast(msg: ErrorConstantString.msgConnectTimeout);
        } else if (e.type == DioErrorType.receiveTimeout) {
          Utility.printLog('', 'SEND TIMEOUT123');
          Fluttertoast.showToast(msg: ErrorConstantString.msgReceiveTimeout);
          return Future.value();
        } else if (e.type == DioErrorType.sendTimeout) {
          Utility.printLog('', 'SEND TIMEOUT123');
          Fluttertoast.showToast(msg: ErrorConstantString.msgSendTimeout);
        } else if (e.type == DioErrorType.other) {
          Utility.printLog('', 'SEND TIMEOUT123');
          Fluttertoast.showToast(
              msg: ErrorConstantString.msgSomethingWentWrong);
          return Future.value();
        } else if (e.type == DioErrorType.cancel) {
          if (e.error == ErrorConstantString.strDuplicateRequest) {
            // Handle duplicate request error if needed.
            Utility.printLog('error', '${e.error}');
            Utility.printLog('', 'SEND TIMEOUT123');
          }
        } else {
          Utility.printLog('', 'SEND TIMEOUT123');
          return Future.value();
        }
        if (e.type == DioErrorType.other) {
          Utility.printLog('', 'SEND TIMEOUT123');
          return Future.value();
        }
      }
      if (e.type == DioErrorType.other) {
        Utility.printLog('', 'SEND TIMEOUT123');
        return Future.value();
      }
    }
  }

  Future<Map<String, dynamic>> headers(bool isAuthRequired, String? passportToken) =>
      getIt<DioClient>().getHeaders('', isAuthRequired: isAuthRequired,
          authToken: passportToken);



}