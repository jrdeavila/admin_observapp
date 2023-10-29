import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_opservapp/lib.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class DioModule {
  @lazySingleton
  Dio get dio => Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: 5000.milliseconds,
          receiveTimeout: 5000.milliseconds,
          headers: {
            'content-type': 'text/html; charset=utf-8',
            'application': 'x-www-form-urlencoded',
            "X-Metabase-Session": "1d603365-60e8-49a9-86f7-5ea28acff4d1",
          },
        ),
      )..interceptors.addAll(interceptors);

  List<Interceptor> get interceptors => [
        TokenInterceptor(),
        ValidatorInterceptor(),
        NotificationInterceptor(),
        LogInterceptor(
          responseBody: true,
        )
      ];
}

@module
abstract class SharedPreferencesModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
