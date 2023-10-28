import 'package:get/get.dart';
import 'package:mobile_opservapp/lib.dart';

class DashboardItem {
  final String name;
  final String route;

  DashboardItem({
    required this.name,
    required this.route,
  });
}

class DashboardController extends GetxController {
  final RxInt _currentIndex = RxInt(0);
  final List<DashboardItem> items = [
    DashboardItem(
      name: "Configuracion de indicadores",
      route: "/indicators",
    ),
    DashboardItem(
      name: "Ir a metabse",
      route: "/metabase",
    ),
  ];

  int get currentIndex => _currentIndex.value;

  void onIndexChanged(int index) {
    _currentIndex.value = index;
  }

  void onSectionTap(Section section) {
    Get.toNamed(sectionManagmentRoute, arguments: section);
  }
}
