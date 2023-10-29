import 'package:flutter/foundation.dart';
import 'package:mobile_opservapp/lib.dart';

abstract class ISectionDataRepository {
  Future<Iterable<Section>> getSections();

  Future<ExtendedSection> getSection(Section section);

  Future<void> deleteSection(Section section);
  Future<Section> storeSection({
    required String title,
    required String description,
    required Uint8List image,
  });
}
