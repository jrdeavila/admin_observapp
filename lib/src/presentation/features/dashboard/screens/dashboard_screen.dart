import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_opservapp/lib.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      body: DashboardView(
        sections: [
          DashboardSection(
            title: "Dashboard",
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: ItemCard(
                            title: "Configuracion de los indicadores",
                            icon: "assets/icons/indicators.png",
                            onTap: () {
                              Get.toNamed(sectionManagmentRoute);
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 30.0,
                        ),
                        Expanded(
                          child: ItemCard(
                            title: "Administracion de usuarios",
                            icon: "assets/icons/user-managment.png",
                            onTap: () {},
                          ),
                        ),
                        const SizedBox(
                          width: 30.0,
                        ),
                        Expanded(
                          child: ItemCard(
                            title: "Administracion de infografias",
                            icon: "assets/icons/infographic.png",
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    ExtendedItemCard(
                      title: "Metabase",
                      desc:
                          "Administra los tableros de informacion usando la informacion de BigQuery",
                      color: const Color(0xFFdde9fa),
                      icon: "assets/icons/metabase.png",
                      onTap: () {
                        controller.toMetabase();
                      },
                    ),
                    ExtendedItemCard(
                      title: "Big Query",
                      desc:
                          "Usa los servicios de Google Cloud Computing - Big Query para normalizar los datos. Tus datos estan guardados y respaldados en la nube de cloud.",
                      color: const Color(0xFFdde9fa),
                      icon: "assets/icons/bigquery.png",
                      onTap: () {
                        controller.toBigQuery();
                      },
                    ),
                  ],
                ),
              ),
            ],
            icon: const Icon(Icons.dashboard_outlined, size: 40.0),
          ),
          DashboardSection(
              title: "Configuracion de la cuenta",
              children: [],
              icon: const Icon(Icons.account_circle_outlined, size: 40.0),
              isEndSection: true,
              isIndexable: false,
              onTap: () {
                Get.toNamed(profileRoute);
              }),
          DashboardSection(
              title: "Configuración",
              children: [],
              icon: const Icon(Icons.settings_outlined, size: 40.0),
              isEndSection: true,
              isIndexable: false,
              onTap: () {
                // TODO: Implement this route
                print("Go to settings");
              }),
        ],
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onTap;
  const ItemCard(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 20.0),
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.asset(
                icon,
                width: 100,
                height: 100,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
              child: Text(
                title,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExtendedItemCard extends StatelessWidget {
  final String title;
  final String desc;
  final String icon;
  final Color color;
  final VoidCallback onTap;
  const ExtendedItemCard(
      {super.key,
      required this.title,
      required this.desc,
      required this.icon,
      required this.color,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 20.0),
        padding: const EdgeInsets.all(40.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.asset(
                icon,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      desc,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
