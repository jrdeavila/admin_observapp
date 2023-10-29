import 'package:mobile_opservapp/lib.dart';

Section sectionFromJSON(JSON json) {
  return Section(
    id: json["id"],
    title: json["title"],
    slug: json["slug"],
    image: json["image"],
    description: json["description"],
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
