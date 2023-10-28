import 'package:mobile_opservapp/lib.dart';

Section sectionFromJSON(JSON json) {
  return Section(
    id: json["id"],
    title: json["title"],
    slug: json["slug"],
    image: json["image"],
  );
}

ExtendedSection extendedSectionFromJSON(JSON json) {
  return ExtendedSection(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    image: json["image"],
    subSections: (json["sub-sections"] as List<dynamic>)
        .map((e) => subSectionFromJSON(e)),
  );
}

SubSection subSectionFromJSON(JSON json) {
  return SubSection(
    id: json["id"],
    title: json["title"],
    slug: json["slug"],
    description: json["description"],
    image: json["image"],
    dashboardUrl: json["dashboard_url"],
  );
}
