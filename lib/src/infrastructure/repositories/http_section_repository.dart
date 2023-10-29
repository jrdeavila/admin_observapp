import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_opservapp/lib.dart';

@Injectable(as: ISectionDataRepository)
class HttpSectionRespository implements ISectionDataRepository {
  final IHttpClient _httpClient;

  HttpSectionRespository(this._httpClient);
  @override
  Future<ExtendedSection> getSection(Section section) {
    return _httpClient
        .get<JSON>("$sectionsDomainEndpoint/admin/sections/${section.slug}")
        .then((value) => extendedSectionFromJSON(value["data"]));
  }

  @override
  Future<Iterable<Section>> getSections() {
    return _httpClient.get<JSON>("$sectionsDomainEndpoint/admin/sections").then(
        (value) =>
            (value["data"] as List<dynamic>).map((e) => sectionFromJSON(e)));
  }

  @override
  Future<void> deleteSection(Section section) {
    return _httpClient
        .delete<JSON>("$sectionsDomainEndpoint/admin/sections/${section.slug}");
  }

  @override
  Future<Section> storeSection(
      {required String title,
      required String description,
      required Uint8List image}) {
    final file = MultipartFile.fromBytes(
      image,
      filename: "$title.jpg",
      headers: {
        "Content-Type": ["image/jpeg"],
      },
    );
    final form = FormData();
    form.files.add(MapEntry("image", file));
    form.fields.add(MapEntry("title", title));
    form.fields.add(MapEntry("description", description));
    return _httpClient
        .post<JSON>(
          "$sectionsDomainEndpoint/admin/sections",
          data: form,
        )
        .then((value) => sectionFromJSON(value['data']));
  }
}
