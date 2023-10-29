import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mobile_opservapp/src/src.dart';

class CreateSectionController extends GetxController {
  final IValidatorService _validatorService = getIt();

  final RxString _title = "".obs;
  final RxString _description = "".obs;
  final Rx<Uint8List?> _image = Rx(null);
  final RxMap<String, List> _errors = <String, List>{}.obs;

  String get title => _title.value;
  String get description => _description.value;
  Uint8List? get image => _image.value;
  Map<String, List> get errors => _errors;

  void setTitle(String title) => _title.value = title;
  void setDescription(String description) => _description.value = description;
  void setImage(Uint8List? image) => _image.value = image;

  @override
  void onReady() {
    super.onReady();
    _validatorService.onListen((value) {
      _errors.value = value;
    });
  }

  void clear() {
    _title.value = "";
    _description.value = "";
    _image.value = null;
  }

  void submit() {
    _validatorService.deleteErrors();
    var errors = _validate();
    if (_isValid(errors)) {
      getIt<IStoreSectionUseCase>()
          .storeSection(
        CreateSectionRequest(
          title: title,
          description: description,
          image: image!,
        ),
      )
          .then((value) {
        Get.find<SectionDetailsController>().onCreateNewSection(value);
        Get.back();
      });
    } else {
      _validatorService.saveErrors(errors);
    }
  }

  Map<String, List> _validate() {
    final currentErrors = <String, List>{
      "title": [],
      "description": [],
      "image": [],
    };
    if (_title.isEmpty) {
      currentErrors["title"] = ["El título es requerido"];
    }

    if (_description.isEmpty) {
      currentErrors["description"] = ["La descripción es requerida"];
    }

    if (image == null) {
      currentErrors["image"] = ["La imagen es requerida"];
    }
    return currentErrors;
  }

  bool _isValid(Map<String, List> errors) {
    return errors.values.every((element) => element.isEmpty);
  }
}
