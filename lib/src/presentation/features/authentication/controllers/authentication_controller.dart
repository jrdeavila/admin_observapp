import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_opservapp/lib.dart';

@injectable
class LoginCtrl extends GetxController {
  late final _validatorService = getIt<IValidatorService>();
  final Rx<String?> _email = Rx<String?>(null);
  final Rx<String?> _password = Rx<String?>(null);
  final RxBool _rememberMe = RxBool(false);

  final RxMap<String, List> _errors = RxMap({});

  List<String> errors(String key) => _errors[key]?.cast<String>() ?? [];
  bool get rememberMe => _rememberMe.value;
  String? get email => _email.value;
  String? get password => _password.value;

  void setEmail(String? value) => _email.value = value;
  void setPassword(String? value) => _password.value = value;
  void setRememberMe(bool? value) => _rememberMe.value = value ?? false;

  @override
  void onReady() {
    super.onReady();
    _loadFromCache();

    _validatorService.onListen((p0) {
      _errors.value = p0;
    });
  }

  void _loadFromCache() {
    Future.delayed(1.seconds, () {
      getIt<CacheService>().read("rememberMe").then((value) {
        if (value == "1") {
          _rememberMe.value = true;
          getIt<CacheService>().read("email").then((value) {
            _email.value = value;
          });
          getIt<CacheService>().read("password").then((value) {
            _password.value = value;
          });
        }
      });
    });
  }

  Future<bool> submit() async {
    await getIt<ILoginUseCase>().login(
      LoginRequest(
        email: email!,
        password: password!,
      ),
    );

    Get.find<SessionController>().onLogin();
    return true;
  }

  void goToRegister() {
    Get.offAllNamed(registerRoute);
  }
}
