import 'package:get/get.dart';
import 'package:mobile_opservapp/lib.dart';

class SessionController extends GetxController {
  final Rx<User?> _user = Rx<User?>(null);

  User? get user => _user.value;

  @override
  void onReady() {
    super.onReady();
    _fetchUserData();
    _user.listen(_redirect);
  }

  void _redirect(User? user) {
    if (user != null) {
      Get.offAllNamed(dashboardRoute);
    } else {
      Get.offAllNamed(loginRoute);
    }
  }

  Future<void> _fetchUserData() async {
    final user = await getIt<IGetUserUseCase>().getUser();
    _user.value = user;
  }

  Future<void> onRegiter() {
    return _fetchUserData();
  }

  Future<void> onLogin() {
    return _fetchUserData();
  }

  Future<void> onLogout() {
    _user.value = null;
    return getIt<ILogoutUseCase>().logout();
  }
}
