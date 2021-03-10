import 'package:flutter/foundation.dart';

class AppliedVacancy {
  final String id;
  final String name;
  final String requiredExp;
  final String exhibitorName;
  final String exhibitorID;

  AppliedVacancy({
    @required this.id,
    @required this.name,
    @required this.requiredExp,
    @required this.exhibitorName,
    @required this.exhibitorID,
  });
}
