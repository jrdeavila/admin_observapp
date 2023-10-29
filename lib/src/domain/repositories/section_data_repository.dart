import 'package:flutter/foundation.dart';
import 'package:mobile_opservapp/lib.dart';

abstract class ISectionDataRepository {
  Future<Iterable<Section>> getSections();

  Future<void> deleteSection(Section section);
  Future<Section> storeSection({
    required String title,
    required String description,
    required Uint8List image,
  });

  Future<Section> updateSection({
    required String slug,
    required String title,
    String? description,
    Uint8List? image,
  });
}

abstract class ISubSectionsDataRepository {
  Future<Iterable<SubSection>> getSubSections(Section section);

  Future<SubSection> storeSubSection({
    required String title,
    required String description,
    required Uint8List image,
    required Section section,
    required String dashboardUrl,
  });

  Future<SubSection> updateSubSection({
    required String slug,
    required String title,
    String? description,
    Uint8List? image,
    String? dashboardUrl,
    required Section section,
  });

  Future<void> deleteSubSection(SubSection subSection, Section section);
}
