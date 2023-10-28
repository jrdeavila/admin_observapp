import 'package:get/get.dart';
import 'package:mobile_opservapp/lib.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginCtrl());
  }
}
