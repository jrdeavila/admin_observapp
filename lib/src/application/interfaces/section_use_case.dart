import 'package:mobile_opservapp/lib.dart';

abstract class IConsultSectionsUseCase {
  Future<Iterable<Section>> getSections();
}

abstract class IConsultSubSectionsUseCase {
  Future<Iterable<SubSection>> getSection(Section section);
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

abstract class IUpdateSectionUseCase {
  Future<Section> updateSection(UpdateSectionRequest section);
}

abstract class IStoreSubSectionUseCase {
  Future<SubSection> storeSubSection(CreateSubSectionRequest section);
}

abstract class IUpdateSubSectionUseCase {
  Future<SubSection> updateSubSection(UpdateSubSectionRequest section);
}

abstract class IDeleteSubSectionUseCase {
  Future<void> deleteSubSection(SubSection subSection, Section section);
}
