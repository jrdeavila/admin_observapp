import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_opservapp/lib.dart';
import 'package:mobile_opservapp/src/presentation/common/widgets/pickers.dart';

class FormSection extends GetView<CreateSectionController> {
  const FormSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Center(
        child: SizedBox(
          width: 500.0,
          height: 500,
          child: Material(
            color: Colors.transparent,
            child: Stack(
              children: [
                Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 50.0, bottom: 10.0, left: 10.0, right: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AppTxtField(
                          hintText: "Titulo",
                          errors: controller.errors["title"],
                          onChange: (value) => controller.setTitle(value),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        AppTxtField(
                          hintText: "Descripcion",
                          errors: controller.errors["description"],
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
                Align(
                  alignment: FractionalOffset(
                    0.5,
                    -0.15 * (controller.errors.isEmpty ? 1 : 2),
                  ),
                  child: ImagePickerWidget(
                      onChoose: (image) => controller.setImage(image),
                      builder: ((context, image) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 30.0),
                          decoration: BoxDecoration(
                            image: image != null
                                ? DecorationImage(
                                    image: MemoryImage(image),
                                    fit: BoxFit.cover,
                                  )
                                : null,
                            borderRadius: BorderRadius.circular(20.0),
                            color: const Color(0xFFdde9fa),
                          ),
                          height: 250,
                          child: image == null
                              ? Center(
                                  child: Icon(
                                    FontAwesomeIcons.image,
                                    size: 100,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                )
                              : null,
                        );
                      })),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
