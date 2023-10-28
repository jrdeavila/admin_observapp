import 'package:mobile_opservapp/lib.dart';

String sectionImageUrl(String filepath) =>
    '$baseUrl$sectionsDomainEndpoint$filepath'.replaceFirst("/public", "");
