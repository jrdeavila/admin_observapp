import 'package:get/get.dart';
import 'package:mobile_opservapp/lib.dart';

class SectionDetailsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SectionDetailsController>(() => SectionDetailsController());
    Get.put(CreateSectionController());
  }
}
