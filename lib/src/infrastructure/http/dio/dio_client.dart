import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_opservapp/lib.dart';

@Injectable(as: IHttpClient)
class DioHttpClient implements IHttpClient {
  final Dio _dio;

  const DioHttpClient(this._dio);

  @override
  Future<T> delete<T>(String path, {Map<String, dynamic>? queryParameters}) {
    return _dio
        .delete<T>(
      path,
      queryParameters: queryParameters,
    )
        .then((value) {
      return value.data!;
    });
  }

  @override
  Future<T> get<T>(String path, {Map<String, dynamic>? queryParameters}) {
    return _dio
        .get<T>(
      path,
      queryParameters: queryParameters,
    )
        .then((value) {
      return value.data!;
    });
  }

  @override
  Future<T> post<T>(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) {
    return _dio
        .post<T>(
          path,
          data: data,
          queryParameters: queryParameters,
        )
        .then((value) => value.data!);
  }

  @override
  Future<T> put<T>(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) {
    return _dio
        .put<T>(
          path,
          data: data,
          queryParameters: queryParameters,
        )
        .then((value) => value.data!);
  }
}
