
import 'package:dio/dio.dart';

import 'package:ipo_tracker/di/injection_container.dart';
import 'package:ipo_tracker/secure_storage/app_shared_preferences.dart';

// Auth Interceptors used for add 'authorization' in header of every request and
// check every response of request is not a unauthorized or token expired,
// if has token expired then fetch new token and replce to request header and send request.
class AuthInterceptor extends Interceptor {
  final String accessToken;

  AuthInterceptor(this.accessToken);
  final dio = getIt<Dio>();
  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final String  accessToken=await AppSecureSharedPreferences.getUserAuthKey();
    options.headers['authorization'] = accessToken;
    super.onRequest(options, handler);
  }

  // @override
  // Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
  //   if (err.response == null) {
  //     return handler.reject(err);
  //   }
  //   if(err.response?.statusCode==401){
  //     final newAccessToken=await getIt<DioClient>().doRefreshToken();
  //         if(newAccessToken.isNotEmpty ){
  //           dio.options.headers['Authorization'] = 'Bearer $accessToken';
  //           return handler.resolve(await dio.fetch(err.requestOptions));
  //         }
  //   }
  //   return handler.next(err);
  // }
}
