import 'package:mobile_opservapp/lib.dart';

abstract class IConsultSectionsUseCase {
  Future<Iterable<Section>> getSections();
}

abstract class IConsultExtendedSectionUseCase {
  Future<ExtendedSection> getSection(Section section);
}

abstract class INavigateToDashboardUseCase {
  void navigateToSubSection(SubSection subSection);
}

abstract class IDeleteSectionUseCase {
  Future<void> deleteSection(Section section);
}

abstract class IStoreSectionUseCase {
  Future<Section> storeSection(CreateSectionRequest section);
}
