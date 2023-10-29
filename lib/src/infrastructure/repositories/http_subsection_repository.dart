import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_opservapp/lib.dart';

@Injectable(as: ISubSectionsDataRepository)
class HttpSubSectionRepository implements ISubSectionsDataRepository {
  final IHttpClient _httpClient;

  HttpSubSectionRepository(this._httpClient);
  @override
  Future<Iterable<SubSection>> getSubSections(Section section) {
    return _httpClient
        .get<JSON>(
            "$sectionsDomainEndpoint/admin/sections/${section.slug}/subsections")
        .then((value) =>
            (value["data"] as List<dynamic>).map((e) => subSectionFromJSON(e)));
  }

  @override
  Future<void> deleteSubSection(SubSection subSection, Section section) {
    return _httpClient.delete(
        "$sectionsDomainEndpoint/admin/sections/${section.slug}/subsections/${subSection.slug}");
  }

  @override
  Future<SubSection> storeSubSection(
      {required String title,
      required String description,
      required Uint8List image,
      required Section section,
      required String dashboardUrl}) async {
    final form = FormData();
    final file = MultipartFile.fromBytes(image,
        filename: "${section.slug}-$title.png",
        headers: {
          "Content-Type": ["image/jpg"],
        });
    form.files.add(MapEntry("image", file));
    form.fields.add(MapEntry("title", title));
    form.fields.add(MapEntry("description", description));
    form.fields.add(MapEntry("dashboard_url", dashboardUrl));

    return _httpClient
        .post<JSON>(
            "$sectionsDomainEndpoint/admin/sections/${section.slug}/subsections",
            data: form)
        .then((value) => subSectionFromJSON(value["data"]));
  }

  @override
  Future<SubSection> updateSubSection(
      {required String slug,
      required String title,
      String? description,
      Uint8List? image,
      String? dashboardUrl,
      required Section section}) async {
    final form = FormData();

    if (title.isNotEmpty) {
      form.fields.add(MapEntry("title", title));
    }

    if (description != null && description.isNotEmpty) {
      form.fields.add(MapEntry("description", description));
    }

    if (image != null) {
      form.files.add(MapEntry(
          "image",
          MultipartFile.fromBytes(image,
              filename: "${section.slug}-$title.png",
              headers: {
                "Content-Type": ["image/jpg"],
              })));
    }

    if (dashboardUrl != null && dashboardUrl.isNotEmpty) {
      form.fields.add(MapEntry("dashboard_url", dashboardUrl));
    }

    return _httpClient.post<JSON>(
        "$sectionsDomainEndpoint/admin/sections/${section.slug}/subsections/$slug",
        data: form,
        queryParameters: {
          "_method": "PUT",
        }).then((value) => subSectionFromJSON(value["data"]));
  }
}
