import 'package:flutter/foundation.dart';
import 'application.dart';

class Vacancy {
  final String id;
  final String name;
  String requiredExp;
  List<Application> applications = [];

  Vacancy({
    @required this.id,
    @required this.name,
    @required this.requiredExp,
  });
}
