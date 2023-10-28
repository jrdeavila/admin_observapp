import 'package:mobile_opservapp/lib.dart';

User userFromJSON(JSON json) {
  return User(
    id: json["id"],
    name: json["name"],
    email: json["email"],
  );
}
