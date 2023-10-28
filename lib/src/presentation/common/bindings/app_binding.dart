import 'package:get/get.dart';
import 'package:mobile_opservapp/lib.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<SessionController>(SessionController());
  }
}
