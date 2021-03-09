import 'package:flutter/foundation.dart';

class Notification {
  final String id;
  final String text;
  final DateTime datetime;

  Notification({
    @required this.id,
    @required this.text,
    @required this.datetime,
  });
}
