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
