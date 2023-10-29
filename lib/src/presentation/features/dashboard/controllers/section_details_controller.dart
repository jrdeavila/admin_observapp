import 'package:get/get.dart';
import 'package:mobile_opservapp/lib.dart';

class SectionDetailsController extends GetxController {
  final RxList<Section> _sections = RxList();
  final RxBool _loading = false.obs;

  List<Section> get sections => _sections;
  bool get isLoading => _loading.value;

  @override
  void onReady() {
    super.onReady();
    _fetchExtendedSection();
  }

  void _fetchExtendedSection() async {
    _loading.value = true;
    await Future.delayed(1.seconds);
    final value = await getIt<IConsultSectionsUseCase>().getSections();
    _sections.value = value.toList();
    _loading.value = false;
  }

  void navigateToSubSection(SubSection subSection) {
    getIt<INavigateToDashboardUseCase>().navigateToSubSection(subSection);
  }

  void onSelectSection(Section section) {}

  void onSectionAction(SectionAction? action, Section section) {
    actionCallbacks[action]?.call(section);
  }

  Map<SectionAction, Future<void> Function(Section section)>
      get actionCallbacks => {
            SectionAction.delete: (section) {
              return Get.dialog<bool>(
                      SectionDeletionAlert(title: section.title))
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
            }
          };

  void onCreateNewSection(Section section) {
    _sections.add(section);
  }
}

enum SectionAction {
  delete,
  update,
}
