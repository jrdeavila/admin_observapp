import 'package:injectable/injectable.dart';
import 'package:mobile_opservapp/lib.dart';

@Injectable(as: IAuthenticationService)
class HttpAuthenticationService implements IAuthenticationService {
  final IHttpClient _httpClient;

  HttpAuthenticationService(this._httpClient);

  @override
  Future<User> getUser() {
    return _httpClient.post("/auth/v1/admin/me").then(
          (value) => userFromJSON(value),
        );
  }

  @override
  Future<String> login(String email, String password) {
    return _httpClient.post(
      "/auth/v1/admin/login",
      data: {
        "email": email,
        "password": password,
      },
    ).then(
      (value) => value["access_token"],
    );
  }

  @override
  Future<void> logout() {
    return _httpClient.post("/auth/v1/admin/logout");
  }

  @override
  Future<String> refreshToken() {
    return _httpClient.post("/auth/v1/admin/refresh-token").then(
          (value) => value["access_token"],
        );
  }

  @override
  Future<String> register(
      String name, String email, String password, String confirmPassword) {
    return _httpClient.post(
      "/auth/v1/admin/register",
      data: {
        "name": name,
        "email": email,
        "password": password,
        "password_confirmation": confirmPassword,
      },
    ).then(
      (value) => value["access_token"],
    );
  }
}
