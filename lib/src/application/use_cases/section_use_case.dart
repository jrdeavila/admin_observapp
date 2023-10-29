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

@Injectable(as: IConsultExtendedSectionUseCase)
class ConsultExtendedSectionUseCase implements IConsultExtendedSectionUseCase {
  final ISectionDataRepository _sectionDataRepository;

  ConsultExtendedSectionUseCase(this._sectionDataRepository);

  @override
  Future<ExtendedSection> getSection(Section section) {
    return _sectionDataRepository.getSection(section);
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
