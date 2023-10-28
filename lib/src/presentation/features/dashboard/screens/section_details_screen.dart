import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_opservapp/src/src.dart';

class SectionDetailsScreen extends GetView<SectionDetailsController> {
  const SectionDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DashboardView(
        sections: [
          DashboardSection(
              title: "Indicadores Socieconomicos",
              children: [
                Obx(() {
                  if (controller.isLoading || controller.sections.isNotEmpty) {
                    return SizedBox(
                      height: 300,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          if (!controller.isLoading)
                            ...controller.sections.map(
                              (e) => _buildCard(e),
                            ),
                          if (controller.isLoading)
                            ...List.generate(
                                10, (index) => const SectionCardSkeleton()),
                        ],
                      ),
                    );
                  } else {
                    return Center(
                      child: Container(
                        padding: const EdgeInsets.all(30.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          Image.asset(
                            "assets/icons/empty.png",
                            height: 200,
                            width: 200,
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          const Text(
                            "UPS! No hemos encontrado nada aun.",
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          )
                        ]),
                      ),
                    );
                  }
                })
              ],
              icon: const Icon(
                Icons.arrow_back,
                size: 40.0,
              ),
              isIndexable: false,
              onTap: () {
                Get.back();
              })
        ],
      ),
      floatingActionButton: CustomFloatingButton(
        onTap: (details) {
          dialogBuilder(
            context,
            details.globalPosition,
            const FormSection(),
          );
        },
        icon: FontAwesomeIcons.paperclip,
      ),
    );
  }

  PopupableCard<SectionAction> _buildCard(Section e) {
    return PopupableCard(
      onSelected: (value) {
        controller.onSectionAction(value, e);
      },
      popupMenuItems: const [
        PopupMenuItem<SectionAction>(
          value: SectionAction.delete,
          child: Row(
            children: [
              Icon(Icons.delete),
              SizedBox(
                width: 10.0,
              ),
              Text("Eliminar"),
            ],
          ),
        ),
        PopupMenuItem<SectionAction>(
          value: SectionAction.update,
          child: Row(
            children: [
              Icon(Icons.update),
              SizedBox(
                width: 10.0,
              ),
              Text("Actualizar"),
            ],
          ),
        )
      ],
      child: SectionCard(
        title: e.title,
        image: e.image,
        onTap: () {
          controller.onSelectSection(e);
        },
      ),
    );
  }
}

class FormSection extends StatelessWidget {
  const FormSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 500.0,
        height: 400,
        child: Material(
          color: Colors.transparent,
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(
                    top: 100.0, bottom: 10.0, left: 10.0, right: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppTxtField(
                      hintText: "Titulo",
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    AppTxtField(
                      hintText: "Descripcion",
                      maxLines: 7,
                      minLines: 5,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: const FractionalOffset(0.5, -0.45),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: const Color(0xFFdde9fa),
                  ),
                  height: 180,
                  child: Center(
                    child: Icon(
                      FontAwesomeIcons.image,
                      size: 100,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
