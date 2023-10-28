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
            "X-Metabase-Session": "1d603365-60e8-49a9-86f7-5ea28acff4d1",
            'Access-Control-Allow-Origin': '*',
            'Access-Control-Allow-Headers': 'Content-Type',
            'Access-Control-Allow-Methods':
                'GET, POST, OPTIONS, PUT, PATCH, DELETE',
          },
        ),
      )..interceptors.addAll(interceptors);

  List<Interceptor> get interceptors => [
        TokenInterceptor(),
        ValidatorInterceptor(),
        NotificationInterceptor(),
      ];
}

@module
abstract class SharedPreferencesModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
