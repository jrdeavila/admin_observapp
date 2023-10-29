import 'package:injectable/injectable.dart';
import 'package:mobile_opservapp/lib.dart';

@Injectable(as: IConsultSectionsUseCase)
class ConsultSectionUseCase implements IConsultSectionsUseCase {
  final ISectionDataRepository _sectionDataRepository;

  ConsultSectionUseCase(this._sectionDataRepository);

  @override
  Future<Iterable<Section>> getSections() {
    return _sectionDataRepository.getSections();
  }
}

@Injectable(as: IConsultSubSectionsUseCase)
class ConsultExtendedSectionUseCase implements IConsultSubSectionsUseCase {
  final ISubSectionsDataRepository _subSectionsDataRepository;

  ConsultExtendedSectionUseCase(this._subSectionsDataRepository);
  @override
  Future<Iterable<SubSection>> getSection(Section section) {
    return _subSectionsDataRepository.getSubSections(section);
  }
}

@Injectable(as: INavigateToDashboardUseCase)
class NavigateToDashboardUseCase implements INavigateToDashboardUseCase {
  final ISectionDashboardService _showSectionDashboardService;

  NavigateToDashboardUseCase(this._showSectionDashboardService);
  @override
  void navigateToSubSection(SubSection subSection) {
    _showSectionDashboardService.showSectionDashboard(subSection);
  }
}

@Injectable(as: IDeleteSectionUseCase)
class DeleteSectionUseCase implements IDeleteSectionUseCase {
  final ISectionDataRepository _service;

  DeleteSectionUseCase(this._service);
  @override
  Future<void> deleteSection(Section section) {
    return _service.deleteSection(section);
  }
}

@Injectable(as: IStoreSectionUseCase)
class StoreSectionUseCase implements IStoreSectionUseCase {
  final ISectionDataRepository _service;
  StoreSectionUseCase(this._service);

  @override
  Future<Section> storeSection(CreateSectionRequest section) {
    return _service.storeSection(
      title: section.title,
      description: section.description,
      image: section.image,
    );
  }
}

@Injectable(as: IUpdateSectionUseCase)
class UpdateSectionUseCase implements IUpdateSectionUseCase {
  final ISectionDataRepository _service;
  UpdateSectionUseCase(this._service);

  @override
  Future<Section> updateSection(UpdateSectionRequest section) {
    return _service.updateSection(
      slug: section.slug,
      title: section.title,
      description: section.description,
      image: section.image,
    );
  }
}

@Injectable(as: IStoreSubSectionUseCase)
class StoreSubSectionUseCase implements IStoreSubSectionUseCase {
  final ISubSectionsDataRepository _service;
  StoreSubSectionUseCase(this._service);

  @override
  Future<SubSection> storeSubSection(CreateSubSectionRequest section) {
    return _service.storeSubSection(
      title: section.title,
      description: section.description,
      image: section.image,
      section: section.section,
      dashboardUrl: section.dashboardUrl,
    );
  }
}

@Injectable(as: IUpdateSubSectionUseCase)
class UpdateSubSectionUseCase implements IUpdateSubSectionUseCase {
  final ISubSectionsDataRepository _service;
  UpdateSubSectionUseCase(this._service);

  @override
  Future<SubSection> updateSubSection(UpdateSubSectionRequest section) {
    return _service.updateSubSection(
      slug: section.slug,
      title: section.title,
      description: section.description,
      image: section.image,
      dashboardUrl: section.dashboardUrl,
      section: section.section,
    );
  }
}

@Injectable(as: IDeleteSubSectionUseCase)
class DeleteSubSectionUseCase implements IDeleteSubSectionUseCase {
  final ISubSectionsDataRepository _service;
  DeleteSubSectionUseCase(this._service);

  @override
  Future<void> deleteSubSection(SubSection subSection, Section section) {
    return _service.deleteSubSection(subSection, section);
  }
}
