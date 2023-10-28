import 'package:get/get.dart';
import 'package:mobile_opservapp/lib.dart';

class DashboardBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
  }
}
