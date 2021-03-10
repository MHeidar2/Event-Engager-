import "package:flutter/foundation.dart";
import 'vacancy.dart';

class Exhibitor {
  final String id;
  final String name;
  final String website;
  final String email;
  final String password;
  final String contactInfo;
  final String logoRef;
  final String address;
  final String about;
  List<Vacancy> myVacancies = [];

  Exhibitor({
    @required this.id,
    @required this.name,
    @required this.website,
    @required this.email,
    @required this.password,
    @required this.contactInfo,
    @required this.logoRef,
    @required this.address,
    @required this.about,
  });
}
