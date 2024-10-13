// ignore_for_file: unnecessary_null_comparison

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:ipo_tracker/di/injection_container.dart';
import 'package:ipo_tracker/secure_storage/app_shared_preferences.dart';
import 'package:ipo_tracker/util/constants/error_constant_string.dart';
import 'package:ipo_tracker/common/api_handler/dio_client.dart';

// This API Interceptors check every response is not an unauthorized response.
// if has unauthorized then get new token and replace it with old, (during this period of time hold all request after token updated then resume all request)
class ApiInterceptors implements Interceptor {
  @override
  Future<dynamic> onRequest(  RequestOptions options, RequestInterceptorHandler handler) async {
    return handler.next(options);
  }

  @override
  Future<dynamic>? onError(DioError error, ErrorInterceptorHandler handler) {
    // do something to error
    return null;
  }

  @override
  // ignore: strict_raw_type
  Future<dynamic> onResponse(Response response, ResponseInterceptorHandler handler) async {
      if (response.statusCode! >= 500) {
        //SOMETHING WENT WRONG NOT ABLE TO REACH SERVER
        Fluttertoast.showToast(msg: ErrorConstantString.msgSomethingWentWrong);
      } else if (response.statusCode! == 401 ||
          response.statusCode! == 403 ||
          response.statusCode! == 404) {
        // CALL REFRESH TOKEN HERE
        String token = await AppSecureSharedPreferences.getUserAuthKey();

        //CONDITION FOR IF MULTIPLE API IS CALLED ASYNC THEN ONLY ONE TIME REFRESH TOKEN WILL GET CALLED
        if (response != null &&
            token != null &&
            token.isNotEmpty &&
            response.requestOptions.headers['authorization'] == token) {
          //TO PAUSE OTHER ASYNC API CALLS
          final dio = getIt<Dio>();
          dio.interceptors.requestLock.lock();
          dio.interceptors.responseLock.lock();

          //REFRESH TOKEN WILL GET CALLED AND WILL REFRESH TOKEN
          // token = await getIt<DioClient>().doRefreshToken();

          response.requestOptions.headers['authorization'] = 'Bearer '+token;
          // Retry the original request with the updated token
          final retryDio = Dio(BaseOptions(baseUrl: response.requestOptions.baseUrl));
          final result = await retryDio.fetch(response.requestOptions);
          // Update the request with the new token

          //TO RESUME ALL API CALLS
          dio.interceptors.requestLock.unlock();
          dio.interceptors.responseLock.unlock();

          //TO RESUME THE CURRENT API CALL
          return handler.resolve(result);
        }
        //TO RESUME THE CURRENT API CALL
        return handler.resolve(response);
      }
      return handler.next(response); // continue

  }
}