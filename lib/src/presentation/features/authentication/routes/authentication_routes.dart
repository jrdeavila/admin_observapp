import 'package:get/get.dart';
import 'package:mobile_opservapp/lib.dart';

const loginRoute = '/login';
const registerRoute = '/register';

final authPages = [
  GetPage(
    name: loginRoute,
    page: () => const OnboardingScreen(),
    binding: LoginBinding(),
  ),
];
