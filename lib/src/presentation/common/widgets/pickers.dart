import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatefulWidget {
  final Widget Function(BuildContext context, Uint8List? image) builder;
  final void Function(Uint8List? value)? onChoose;
  const ImagePickerWidget({super.key, required this.builder, this.onChoose});

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  Uint8List? _imageBytes;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final imageBytes = await pickedFile.readAsBytes();
      _imageBytes = Uint8List.fromList(imageBytes);
      widget.onChoose?.call(_imageBytes);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: widget.builder(context, _imageBytes),
    );
  }
}
