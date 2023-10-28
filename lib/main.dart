import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_opservapp/lib.dart';

void main() {
  runZonedGuarded(() {
    WidgetsFlutterBinding.ensureInitialized();
    configureDependencies();

    runApp(const MyApp());
  }, handlerException);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ObservApp',
      debugShowCheckedModeBanner: false,
      theme: ColorPalete.themeData,
      getPages: [
        ...authPages,
        ...dashboardPages,
      ],
      initialRoute: loginRoute,
      initialBinding: AppBindings(),
    );
  }
}
