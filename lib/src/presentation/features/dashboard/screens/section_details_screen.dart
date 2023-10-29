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
                _buildSectionList(),
                const SizedBox(
                  height: 20.0,
                ),
                _buildSubSectionList(),
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
          controller.onShowFormSection();
        },
        icon: FontAwesomeIcons.paperclip,
      ),
    );
  }

  Obx _buildSubSectionList() {
    return Obx(() {
      if (controller.selectedSection == null) {
        return const SizedBox.shrink();
      }
      return SizedBox(
        height: 400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              decoration: BoxDecoration(
                color: Colors.grey[200],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Metricas de ${controller.selectedSection?.title ?? ""}"
                        .toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      controller.onShowFormSubSection();
                    },
                    child: const Text("Nueva Metrica"),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 31.0,
            ),
            (controller.isFetchingSubSections ||
                    controller.subSections.isNotEmpty)
                ? Expanded(
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        if (!controller.isFetchingSubSections)
                          ...controller.subSections
                              .map((e) => _buildSubSectionCard(e)),
                        if (controller.isFetchingSubSections)
                          ...List.generate(
                              10, (index) => const SectionCardSkeleton()),
                      ],
                    ),
                  )
                : const EmptyMessage(),
          ],
        ),
      );
    });
  }

  Widget _buildSubSectionCard(SubSection e) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: PopupableCard(
        onSelected: (value) {
          controller.onSubSectionAction(value, e);
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
          description: e.description,
          selected: false,
          onTap: () {
            controller.navigateToSubSection(e);
          },
        ),
      ),
    );
  }

  Obx _buildSectionList() {
    return Obx(() {
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
                ...List.generate(10, (index) => const SectionCardSkeleton()),
            ],
          ),
        );
      } else {
        return const EmptyMessage();
      }
    });
  }

  Widget _buildCard(Section e) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: PopupableCard(
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
          description: e.description,
          selected: controller.selectedSection?.id == e.id,
          onTap: () {
            controller.onSelectSection(e);
          },
        ),
      ),
    );
  }
}
