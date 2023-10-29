import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_opservapp/lib.dart';

class FormSection extends StatelessWidget {
  final Section? section;
  const FormSection({super.key, this.section});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CreateSectionController>();
    controller.setSection(section);
    return Obx(() {
      return Center(
        child: SizedBox(
          width: 500.0,
          child: Material(
            color: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ImagePickerWidget(
                      onChoose: (image) => controller.setImage(image),
                      builder: ((context, image) {
                        return Container(
                          decoration: BoxDecoration(
                            image: image != null
                                ? DecorationImage(
                                    image: MemoryImage(image),
                                    fit: BoxFit.cover,
                                  )
                                : section?.image != null
                                    ? DecorationImage(
                                        image: NetworkImage(
                                          "$baseUrl$sectionsDomainEndpoint/storage/${section?.image}",
                                        ),
                                        fit: BoxFit.cover,
                                      )
                                    : null,
                            borderRadius: BorderRadius.circular(20.0),
                            color: const Color(0xFFdde9fa),
                          ),
                          height: 250,
                          child: image != null || section?.image != null
                              ? null
                              : Center(
                                  child: Icon(
                                    FontAwesomeIcons.image,
                                    size: 100,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                        );
                      })),
                  const SizedBox(
                    height: 10.0,
                  ),
                  // Show Errors
                  if (controller.errors.isNotEmpty)
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.red,
                      ),
                      child: Column(
                        children: [
                          for (final error in controller.errors.entries)
                            Row(
                              children: [
                                const Icon(
                                  FontAwesomeIcons.exclamation,
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  error.value.join(', '),
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            )
                        ],
                      ),
                    ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  AppTxtField(
                    initialValue: section?.title,
                    hintText: "Titulo",
                    onChange: (value) => controller.setTitle(value),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  AppTxtField(
                    initialValue: section?.description,
                    hintText: "Descripcion",
                    onChange: (value) => controller.setDescription(value),
                    maxLines: 7,
                    minLines: 5,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  AppRoundedButton(
                    onTap: () {
                      controller.submit();
                    },
                    label: "Guardar",
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

class FormSubSection extends StatelessWidget {
  final Section section;
  final SubSection? subSection;
  const FormSubSection({super.key, required this.section, this.subSection});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CreateSubSectionController(
      section: section,
      subSection: subSection,
    ));
    return Obx(() {
      return Center(
        child: SizedBox(
          width: 500.0,
          child: Material(
            color: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ImagePickerWidget(
                      onChoose: (image) => controller.setImage(image),
                      builder: ((context, image) {
                        return Container(
                          decoration: BoxDecoration(
                            image: image != null
                                ? DecorationImage(
                                    image: MemoryImage(image),
                                    fit: BoxFit.cover,
                                  )
                                : subSection?.image != null
                                    ? DecorationImage(
                                        image: NetworkImage(
                                          "$baseUrl$sectionsDomainEndpoint/storage/${subSection?.image}",
                                        ),
                                        fit: BoxFit.cover,
                                      )
                                    : null,
                            borderRadius: BorderRadius.circular(20.0),
                            color: const Color(0xFFdde9fa),
                          ),
                          height: 250,
                          child: image != null || subSection?.image != null
                              ? null
                              : Center(
                                  child: Icon(
                                    FontAwesomeIcons.image,
                                    size: 100,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                        );
                      })),
                  const SizedBox(
                    height: 10.0,
                  ),
                  // Show Errors
                  if (controller.errors.isNotEmpty)
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.red,
                      ),
                      child: Column(
                        children: [
                          for (final error in controller.errors.entries)
                            Row(
                              children: [
                                const Icon(
                                  FontAwesomeIcons.exclamation,
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  error.value.join(', '),
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            )
                        ],
                      ),
                    ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  AppTxtField(
                    initialValue: subSection?.title,
                    hintText: "Titulo",
                    onChange: (value) => controller.setTitle(value),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),

                  AppTxtField(
                    initialValue: subSection?.description,
                    hintText: "Descripcion",
                    onChange: (value) => controller.setDescription(value),
                    maxLines: 7,
                    minLines: 5,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  AppTxtField(
                    initialValue: subSection?.dashboardUrl,
                    hintText: "Enlace al Dashboard",
                    onChange: (value) => controller.setDashboardUrl(value),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  AppRoundedButton(
                    onTap: () {
                      controller.submit();
                    },
                    label: "Guardar",
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
