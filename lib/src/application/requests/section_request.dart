import 'package:flutter/foundation.dart';
import 'package:mobile_opservapp/lib.dart';

class CreateSectionRequest {
  final String title;
  final String description;
  final Uint8List image;

  CreateSectionRequest({
    required this.title,
    required this.description,
    required this.image,
  });
}

class UpdateSectionRequest {
  final String slug;
  final String title;
  final String? description;
  final Uint8List? image;

  UpdateSectionRequest({
    required this.slug,
    required this.title,
    this.description,
    this.image,
  });
}

class CreateSubSectionRequest {
  final String title;
  final String description;
  final Uint8List image;
  final Section section;
  final String dashboardUrl;

  CreateSubSectionRequest({
    required this.title,
    required this.description,
    required this.image,
    required this.section,
    required this.dashboardUrl,
  });
}

class UpdateSubSectionRequest {
  final String slug;
  final String title;
  final String? description;
  final Uint8List? image;
  final String? dashboardUrl;
  final Section section;

  UpdateSubSectionRequest({
    required this.slug,
    required this.title,
    this.description,
    this.image,
    this.dashboardUrl,
    required this.section,
  });
}
