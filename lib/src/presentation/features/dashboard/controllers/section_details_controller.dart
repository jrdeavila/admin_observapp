import 'package:get/get.dart';
import 'package:mobile_opservapp/lib.dart';

class SectionDetailsController extends GetxController {
  final RxList<Section> _sections = RxList();
  final RxList<SubSection> _subSections = RxList();
  final RxBool _loading = false.obs;
  final RxBool _isFetchingSubSections = false.obs;

  final Rx<Section?> _selectedSection = Rx(null);

  List<Section> get sections => _sections;
  bool get isLoading => _loading.value;
  Section? get selectedSection => _selectedSection.value;
  List<SubSection> get subSections => _subSections;
  bool get isFetchingSubSections => _isFetchingSubSections.value;

  @override
  void onReady() {
    super.onReady();
    ever(_selectedSection, _fetchExtendedSection);
    _fetchSections();
  }

  void _fetchSections() async {
    _loading.value = true;
    await Future.delayed(1.seconds);
    final value = await getIt<IConsultSectionsUseCase>().getSections();
    _sections.value = value.toList();
    _loading.value = false;
  }

  void _fetchExtendedSection(Section? section) async {
    if (section != null) {
      _isFetchingSubSections.value = true;
      await Future.delayed(1.seconds);
      final res = await getIt<IConsultSubSectionsUseCase>().getSection(section);

      _subSections.value = res.toList();
      _isFetchingSubSections.value = false;
    }
  }

  void navigateToSubSection(SubSection subSection) {
    getIt<INavigateToDashboardUseCase>().navigateToSubSection(subSection);
  }

  void onSelectSection(Section section) {
    _selectedSection.value = section;
  }

  void onSectionAction(SectionAction? action, Section section) {
    actionCallbacks[action]?.call(section);
  }

  void onShowFormSection() {
    Get.dialog<bool>(const FormSection()).then((value) {
      Get.find<CreateSectionController>().clear();
    });
  }

  void onShowFormSubSection() {
    if (_selectedSection.value != null) {
      Get.dialog<bool>(FormSubSection(
        section: _selectedSection.value!,
      ));
    }
  }

  void onCreateOrUpdateaSection(Section section) {
    final index =
        _sections.indexWhere((element) => element.slug == section.slug);
    if (index == -1) {
      _sections.add(section);
    } else {
      _sections[index] = section;
    }
    Get.find<CreateSectionController>().clear();
  }

  void onCreateOrUpdateSubSection(SubSection subSection) {
    final index =
        _subSections.indexWhere((element) => element.slug == subSection.slug);
    if (index == -1) {
      _subSections.add(subSection);
    } else {
      _subSections[index] = subSection;
    }
  }

  void onSubSectionAction(SectionAction? value, SubSection e) {
    if (_selectedSection.value != null) {
      subSectionActionCallbacks[value]?.call(_selectedSection.value!, e);
    }
  }

  Map<
      SectionAction,
      Future<void> Function(Section section,
          SubSection subSection)> get subSectionActionCallbacks => {
        SectionAction.delete: (section, subSection) {
          return Get.dialog<bool>(SectionDeletionAlert(
                  title: "la metrica \"${subSection.title}\""))
              .then((value) {
            value = value ?? false;
            if (value) {
              return getIt<IDeleteSubSectionUseCase>()
                  .deleteSubSection(subSection, section)
                  .then((_) {
                _subSections.removeWhere((element) => element.id == section.id);
              });
            }
          });
        },
        SectionAction.update: (section, subSection) {
          return Get.dialog<bool>(
            FormSubSection(
              section: section,
              subSection: subSection,
            ),
          );
        },
      };

  Map<SectionAction, Future<void> Function(Section section)>
      get actionCallbacks => {
            SectionAction.delete: (section) {
              return Get.dialog<bool>(SectionDeletionAlert(
                      title: "El indicador \"${section.title}\""))
                  .then((value) {
                value = value ?? false;
                if (value) {
                  return getIt<IDeleteSectionUseCase>()
                      .deleteSection(section)
                      .then((_) {
                    _sections
                        .removeWhere((element) => element.id == section.id);
                  });
                }
              });
            },
            SectionAction.update: (section) {
              return Get.dialog<bool>(
                FormSection(
                  section: section,
                ),
              );
            },
          };
}

enum SectionAction {
  delete,
  update,
}
