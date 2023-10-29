import 'package:flutter/foundation.dart';

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
